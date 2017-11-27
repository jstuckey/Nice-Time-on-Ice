class GamePresenter

  include ActionView::Helpers::UrlHelper

  def initialize(context)
    @context = context
  end

  def links
    bodies.zip(urls).map do |body, url|
      link_to(body, url, class: "game")
    end
  end

  def dates
    all_games.map do |game|
      game.date.strftime("%a %b %d, %Y")
    end
  end

  def li_classes
    classes = Array.new(all_games.length, "")
    index = all_games.index(context.game) || 0
    classes[index] = %(class="selected").html_safe
    classes
  end

  def order_href
    path_helper(order_path_params)
  end

  def order_class
    if context.game_order == "asc"
      "glyph-up"
    else
      "glyph-down"
    end
  end

  private

  attr_reader :context

  def all_games
    @all_games ||= all_games_query
  end

  def all_games_query
    Game.where(season: context.season, playoffs: playoffs?)
        .where(home_or_away_team)
        .order(date: context.game_order)
        .includes(:away_team, :home_team)
  end

  def home_or_away_team
    ["away_team_id = ? OR home_team_id = ?",
     context.team.id,
     context.team.id]
  end

  def urls
    all_games.map do |game|
      args = path_params(game)
      path_helper(args)
    end
  end

  def path_helper(args)
    Rails.application.routes.url_helpers.root_path(args)
  end

  def path_params(game)
    {
      game: game.game_number,
      season: context.season.year_start,
      team: context.team.abbreviation,
      game_type: context.game_type,
      game_order: context.game_order
    }
  end

  def order_path_params
    {
      season: context.season.year_start,
      team: context.team.abbreviation,
      game_type: context.game_type,
      game_order: opposite_of_current_order
    }
  end

  def bodies
    all_games.map do |game|
      "#{game.away_team.name} at</br>#{game.home_team.name}".html_safe
    end
  end

  def playoffs?
    context.game_type == 3
  end

  def opposite_of_current_order
    if context.game_order == "asc"
      "desc"
    else
      "asc"
    end
  end

end
