class SeasonPresenter

  include ActionView::Helpers::UrlHelper

  def initialize(context)
    @context = context
  end

  def links
    bodies.zip(urls).map do |body, url|
      link_to(body, url, class: "season")
    end
  end

  private

  attr_reader :context

  def all_seasons
    @all_seasons ||= Season.all.order(year_end: :desc)
  end

  def urls
    root_path = ->(args) do
      Rails.application.routes.url_helpers.root_path(args)
    end

    regular = all_seasons.map do |season|
      root_path.call(season: season.year_start,
                     team: context.team.abbreviation,
                     game_type: 2)
    end

    playoffs = all_seasons.map do |season|
      root_path.call(season: season.year_start,
                     team: context.team.abbreviation,
                     game_type: 3)
    end

    regular.zip(playoffs).flatten
  end

  def bodies
    regular = all_seasons.map do |season|
      "#{season.year_start} - #{season.year_end}"
    end

    playoffs = all_seasons.map do |season|
      "#{season.year_start} - #{season.year_end} Playoffs"
    end

    regular.zip(playoffs).flatten
  end

end
