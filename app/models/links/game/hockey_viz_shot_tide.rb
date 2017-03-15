class Links::Game::HockeyVizShotTide < Links::Base

  def site_name
    "Hockey Viz"
  end

  def description
    "Shot Tide"
  end

  def url
    "http://hockeyviz.com/game/#{game.game_number}/tide"
  end

  def group
    4
  end

  def position
    3
  end

end
