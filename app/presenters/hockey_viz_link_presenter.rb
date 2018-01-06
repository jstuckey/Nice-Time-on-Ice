class HockeyVizLinkPresenter < LinkPresenterBase
  def names
    [
      "Team Overview",
      "Game Overview",
      "Shot Tide",
      "5v5 Shots",
      "5v5 Matchups",
      "Home Player Usage",
      "Away Player Usage",
      "Home Zone Deployment",
      "Away Zone Deployment"
    ]
  end

  def links
    %W[
      http://hockeyviz.com/team/#{team.abbreviation}/#{season.year_start.to_s[2, 2]}#{season.year_end.to_s[2, 2]}
      http://hockeyviz.com/game/#{game.game_number}
      http://hockeyviz.com/game/#{game.game_number}/tide
      http://hockeyviz.com/game/#{game.game_number}/byPlayer
      http://hockeyviz.com/game/#{game.game_number}/matchups
      http://hockeyviz.com/game/#{game.game_number}/homeUsage
      http://hockeyviz.com/game/#{game.game_number}/awayUsage
      http://hockeyviz.com/game/#{game.game_number}/homeZone
      http://hockeyviz.com/game/#{game.game_number}/awayZone
    ]
  end
end
