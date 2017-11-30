class HockeyStatsLinkPresenter
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
    [
      "Game Possession",
      "Game Shifts",
      "Playoff Probabilities",
      "Lottery Pick Probabilities"
    ]
  end

  def links
    %W[
      http://hockeystats.ca/game/#{game.game_number}
      http://hockeystats.ca/game/#{game.game_number}/shifts
      http://hockeystats.ca/playoffs
      http://hockeystats.ca/lottery
    ]
  end
end
