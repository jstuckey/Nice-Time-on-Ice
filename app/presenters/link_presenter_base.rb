class LinkPresenterBase
  attr_reader :season, :team, :game, :game_type

  def initialize(request_context)
    @season = request_context.season
    @team = request_context.team
    @game = request_context.game
    @game_type = request_context.game_type
  end

  def each_link
    names.zip(links) { |name, link| yield name, link }
  end

  def names
    fail "Override ##{__method__} method in subclass"
  end

  def links
    fail "Override ##{__method__} method in subclass"
  end
end
