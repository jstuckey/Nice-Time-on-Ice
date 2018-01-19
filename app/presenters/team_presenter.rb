# Constructs links to ourself that change the selected team
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
    index = all_teams.index(context.team) || 0
    classes[index] = %(class="selected").html_safe
    classes
  end

  private

  attr_reader :context

  def all_teams
    @all_teams ||= Team.all.order(:name)
  end

  def urls
    all_teams.map do |team|
      args = path_params(team)
      path_helper(args)
    end
  end

  def path_helper(args)
    Rails.application.routes.url_helpers.root_path(args)
  end

  def path_params(team)
    {
      season: context.season.year_start,
      team: team.abbreviation,
      game_type: context.game_type,
      game_order: context.game_order
    }
  end

  def bodies
    all_teams.pluck(:name)
  end
end
