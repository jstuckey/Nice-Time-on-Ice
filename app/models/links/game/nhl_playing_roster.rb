class Links::Game::NhlPlayingRoster < Links::Base

  include Links::Helpers

  def site_name
    "NHL.com"
  end

  def description
    "Playing Roster"
  end

  def url
    "http://www.nhl.com/scores/htmlreports/" \
    "#{season}/RO#{game_number_without_year}.HTM"
  end

  def group
    0
  end

  def position
    9
  end

end
