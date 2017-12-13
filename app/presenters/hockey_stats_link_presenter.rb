class HockeyStatsLinkPresenter < LinkPresenterBase
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
