class Links::Game::NhlIceTracker < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Ice Tracker"
  end

  def url
    "http://www.nhl.com/ice/icetracker.htm?id=" \
    "#{game.game_number}"
  end

  def group
    0
  end

  def position
    2
  end

end
