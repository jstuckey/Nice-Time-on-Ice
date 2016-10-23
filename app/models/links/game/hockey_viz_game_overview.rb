class Links::Game::HockeyVizGameOverview < Links::Base

  def site_name
    "Hockey Viz"
  end

  def description
    "Game Overview"
  end

  def url
    "http://hockeyviz.com/game/#{game.game_number}"
  end

  def group
    4
  end

  def position
    1
  end

end
