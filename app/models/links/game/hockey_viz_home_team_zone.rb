class Links::Game::HockeyVizHomeTeamZone < Links::Base

  def site_name
    "Hockey Viz"
  end

  def description
    "Home Zone Deployment"
  end

  def url
    "http://hockeyviz.com/game/#{game.game_number}/homeZone"
  end

  def group
    4
  end

  def position
    7
  end

end
