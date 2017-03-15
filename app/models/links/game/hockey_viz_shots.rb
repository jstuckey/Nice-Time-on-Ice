class Links::Game::HockeyVizShots < Links::Base

  def site_name
    "Hockey Viz"
  end

  def description
    "5v5 Shots"
  end

  def url
    "http://hockeyviz.com/game/#{game.game_number}/byPlayer"
  end

  def group
    4
  end

  def position
    4
  end

end
