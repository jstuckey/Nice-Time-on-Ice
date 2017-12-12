class NaturalStatTrickPresenter
  attr_reader :season, :team, :game, :game_type

  include LinkHelpers

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
    ["Game Statistics"]
  end

  def links
    [
    "http://naturalstattrick.com/game.php?" \
      "season=#{season}&game=#{game_number_without_year_and_zero}"
    ]
  end
end
