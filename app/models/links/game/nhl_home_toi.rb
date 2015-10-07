class Links::Game::NhlHomeToi < Links::Base

  include Links::Helpers

  def site_name
    "NHL.com"
  end

  def description
    "Home Time on Ice"
  end

  def url
    "http://www.nhl.com/scores/htmlreports/" \
    "#{season}/TH#{game_number_without_year}.HTM"
  end

  def group
    0
  end

  def position
    7
  end

end
