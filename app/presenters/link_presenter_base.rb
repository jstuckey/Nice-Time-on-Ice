class LinkPresenterBase
  attr_reader :team, :season, :game, :game_type

  def initialize(context = nil)
    return unless context
    if context.is_a? Hash
      context = RequestContext.new(context)
    end

    @team = context.team
    @season = context.season
    @game_type = context.game_type
    @game = context.game
  end

  def site_name
    fail "Override ##{__method__} method in subclass"
  end

  def links
    fail "Override ##{__method__} method in subclass"
  end
end
