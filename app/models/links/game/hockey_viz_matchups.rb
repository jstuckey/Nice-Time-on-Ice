class Links::Game::HockeyVizMatchups < Links::Base

  def site_name
    "Hockey Viz"
  end

  def description
    "5v5 Matchups"
  end

  def url
    "http://hockeyviz.com/game/#{game.game_number}/matchups"
  end

  def group
    4
  end

  def position
    5
  end

end
