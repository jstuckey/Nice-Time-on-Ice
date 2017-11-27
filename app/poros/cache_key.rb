class CacheKey

  def initialize(request_context, date = nil)
    @request_context = request_context
    @date = date || Date.current
  end

  def value
    components.join(SEPARATOR)
  end

  private

  SEPARATOR = "_"

  attr_reader :request_context

  def components
    [team, season, game, game_type, game_order, date]
  end

  def team
    request_context.team.abbreviation.downcase
  end

  def season
    request_context.season.year_start
  end

  def game
    request_context.game.game_number
  end

  def game_type
    request_context.game_type
  end

  def game_order
    request_context.game_order
  end

  def date
    @date.strftime("%Y_%m_%d")
  end
end
