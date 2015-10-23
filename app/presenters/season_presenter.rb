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

  def li_classes
    classes = Array.new(all_seasons.length * 2, "")
    classes[selected_season_index] = %Q(class="selected").html_safe
    classes
  end

  private

  attr_reader :context

  def all_seasons
    @all_seasons ||= Season.all.order(year_end: :desc)
  end

  def urls
    regular = all_seasons.map do |season|
      args = path_params(season)
      args[:game_type] = 2
      path_helper(args)
    end

    playoffs = all_seasons.map do |season|
      args = path_params(season)
      args[:game_type] = 3
      path_helper(args)
    end

    regular.zip(playoffs).flatten
  end

  def path_helper(args)
    Rails.application.routes.url_helpers.root_path(args)
  end

  def path_params(season)
    {
      season: season.year_start,
      team: context.team.abbreviation,
      game_order: context.game_order
    }
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

  def selected_season_index
    # Season list contains regular season and postseason
    # for each year, so we need to do some weird arithmatic
    index = all_seasons.index(context.season) || 0
    index = index * 2
    index += 1 if context.game_type == 3
    index
  end

end
