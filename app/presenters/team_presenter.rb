class TeamPresenter

  include ActionView::Helpers::UrlHelper

  def initialize(context)
    @context = context
  end

  def links
    bodies.zip(urls).map do |body, url|
      link_to(body, url, class: "team")
    end
  end

  def li_classes
    classes = Array.new(all_teams.length, "")
    index = all_teams.index { |t| t == context.team }
    classes[index] = %Q(class="selected").html_safe if index
    classes
  end

  private

  attr_reader :context

  def all_teams
    @all_teams ||= Team.all.order(:name)
  end

  def urls
    root_path = ->(args) do
      Rails.application.routes.url_helpers.root_path(args)
    end

    all_teams.map do |team|
      root_path.call(season: context.season.year_start,
                     team: team.abbreviation,
                     game_type: context.game_type)
    end
  end

  def bodies
    all_teams.pluck(:name)
  end
end
