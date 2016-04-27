class CacheKeys

  def initialize(context, date = nil)
    @context = context
    @date = date || Date.current
  end

  SEPARATOR = "_"

  def season_key
    ["season", season, year, year_half].join(SEPARATOR)
  end

  def team_key
    ["team", team, year, year_half].join(SEPARATOR)
  end

  def game_key
    ["game", team, season, game, game_type, game_order, date].join(SEPARATOR)
  end

  def external_season_link_key
    ["external", "season", "link", team, season, game, game_type, date].join(SEPARATOR)
  end

  def external_game_link_key
    ["external", "game", "link", team, season, game, game_type, date].join(SEPARATOR)
  end

  def external_misc_link_key
    ["external", "misc", "link", team, season, game, game_type, date].join(SEPARATOR)
  end

  private

  attr_reader :context

  def team
    context.team.abbreviation.downcase
  end

  def season
    context.season.year_start
  end

  def game
    context.game.game_number
  end

  def game_type
    context.game_type
  end

  def game_order
    context.game_order
  end

  def date
    @date.strftime("%Y_%m_%d")
  end

  def year
    @date.year
  end

  def year_half
    if @date < mid_year_mark
      "h1"
    else
      "h2"
    end
  end

  def mid_year_mark
    Date.new(@date.year, 7, 1)
  end

end
