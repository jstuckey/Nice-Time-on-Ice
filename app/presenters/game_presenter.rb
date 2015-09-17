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

  def dates_and_links
    dates.zip(links)
  end

  private

  attr_reader :context

  def all_games
    @all_games ||= begin
      Game.where(season: context.season, playoffs: is_playoffs?)
          .where("away_team_id = ? OR home_team_id = ?", context.team.id, context.team.id)
          .order(date: :desc)
    end
  end

  def urls
    root_path = ->(args) do
      Rails.application.routes.url_helpers.root_path(args)
    end

    all_games.map do |game|
      root_path.call(game: game.game_number,
                     season: context.season.year_start,
                     team: context.team.abbreviation,
                     game_type: context.game_type)
    end
  end

  def bodies
    all_games.map do |game|
      "#{game.away_team.name} at</br>#{game.home_team.name}".html_safe
    end
  end

  def is_playoffs?
    context.game_type == 3
  end

end
