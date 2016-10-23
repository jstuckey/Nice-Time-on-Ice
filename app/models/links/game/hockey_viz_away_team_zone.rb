class Links::Game::HockeyVizAwayTeamZone < Links::Base

  def site_name
    "Hockey Viz"
  end

  def description
    "Away Zone Deployment"
  end

  def url
    "http://hockeyviz.com/game/#{game.game_number}/awayZone"
  end

  def group
    4
  end

  def position
    8
  end

end
