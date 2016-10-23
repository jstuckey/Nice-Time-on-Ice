class Links::Game::HockeyVizHomeTeamUsage < Links::Base

  def site_name
    "Hockey Viz"
  end

  def description
    "Home Player Usage"
  end

  def url
    "http://hockeyviz.com/game/#{game.game_number}/homeUsage"
  end

  def group
    4
  end

  def position
    5
  end

end
