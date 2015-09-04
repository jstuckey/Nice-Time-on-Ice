class Links::Game::NhlAwayToi < Links::Base

  include Links::Helpers

  def site_name
    "NHL.com"
  end

  def description
    "Away Time on Ice"
  end

  def url
    "http://www.nhl.com/scores/htmlreports/" \
    "#{season}/TV#{game_number_without_year}.HTM"
  end

  def group
    0
  end

  def position
    8
  end

end
