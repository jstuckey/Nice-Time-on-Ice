class HockeyVizLinkPresenter < LinkPresenterBase
  LINK_BASE = "http://hockeyviz.com/".freeze

  # rubocop:disable MethodLength
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
    [
      team_overview,
      game_overview,
      shot_tide,
      shots,
      matchups,
      home_player_usage,
      away_player_usage,
      home_zone_deployment,
      away_zone_deployment
    ]
  end
  # rubocop:enable MethodLength

  def team_overview
    "#{LINK_BASE}team/#{team.abbreviation}/#{season.year_start.to_s[2, 2]}" \
      "#{season.year_end.to_s[2, 2]}"
  end

  def game_overview
    "#{LINK_BASE}game/#{game.game_number}"
  end

  def shot_tide
    "#{LINK_BASE}game/#{game.game_number}/tide"
  end

  def shots
    "#{LINK_BASE}game/#{game.game_number}/byPlayer"
  end

  def matchups
    "#{LINK_BASE}game/#{game.game_number}/matchups"
  end

  def home_player_usage
    "#{LINK_BASE}game/#{game.game_number}/homeUsage"
  end

  def away_player_usage
    "#{LINK_BASE}game/#{game.game_number}/awayUsage"
  end

  def home_zone_deployment
    "#{LINK_BASE}game/#{game.game_number}/homeZone"
  end

  def away_zone_deployment
    "#{LINK_BASE}game/#{game.game_number}/awayZone"
  end
end
