class Links::Game::HockeyVizAwayTeamUsage < Links::Base

  def site_name
    "Hockey Viz"
  end

  def description
    "Away Player Usage"
  end

  def url
    "http://hockeyviz.com/game/#{game.game_number}/awayUsage"
  end

  def group
    4
  end

  def position
    6
  end

end
