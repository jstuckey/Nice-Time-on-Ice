class Links::Game::NhlPlayByPlay < Links::Base

  include Links::Helpers

  def site_name
    "NHL.com"
  end

  def description
    "Play-by-Play"
  end

  def url
    "http://www.nhl.com/scores/htmlreports/" \
    "#{season}/PL#{game_number_without_year}.HTM"
  end

  def group
    0
  end

  def position
    6
  end

end
