class NullisecundLinkPresenter
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
    [
      "Even Strength Shooting",
      "Shift Chart"
    ]
  end

  def links
    [
      "http://nullisecund.us/nhl/game.php?id=#{game_number_without_year_and_zero}",
      "http://nullisecund.us/nhl/toi.php?id=#{game_number_without_year_and_zero}"
    ]
  end
end
