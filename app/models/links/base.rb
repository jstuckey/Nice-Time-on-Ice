class Links::Base
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

  def self.autoload_links
    path = File.join(Rails.root, "app", "models", "links", "**/*.rb")
    Dir[path].each { |file| require_dependency file }
  end

  def <=>(other)
    if group == other.group
      position <=> other.position
    else
      group <=> other.group
    end
  end

  # Override these methods in subclass

  def site_name
    fail "Override ##{__method__} method in subclass"
  end

  def description
    fail "Override ##{__method__} method in subclass"
  end

  def url
    fail "Override ##{__method__} method in subclass"
  end

  def group
    fail "Override ##{__method__} method in subclass"
  end

  def position
    fail "Override ##{__method__} method in subclass"
  end

  private

  attr_reader :team, :season, :game, :game_type
end
