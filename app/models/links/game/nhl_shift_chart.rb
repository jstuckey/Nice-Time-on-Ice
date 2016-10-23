class Links::Game::NhlShiftChart < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Shift Chart"
  end

  def url
    "http://www.nhl.com/stats/shiftcharts?id=#{game.game_number}"
  end

  def group
    0
  end

  def position
    12
  end

end
