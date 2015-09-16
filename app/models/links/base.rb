class Links::Base

  def initialize(context = nil)
    return unless context
    if context.is_a? Hash
      context = RequestContext.new
    end

    @team = context.team
    @season = context.season
    @game_type = context.game_type
    @game = context.game
  end

  # Override these methods in subclass

  def site_name
    raise "Override ##{__method__} method in subclass"
  end

  def description
    raise "Override ##{__method__} method in subclass"
  end

  def url
    raise "Override ##{__method__} method in subclass"
  end

  def group
    raise "Override ##{__method__} method in subclass"
  end

  def position
    raise "Override ##{__method__} method in subclass"
  end

  private

  attr_reader :team, :season, :game, :game_type

end
