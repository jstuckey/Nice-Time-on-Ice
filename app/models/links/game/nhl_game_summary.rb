class Links::Game::NhlGameSummary < Links::Base

  include Links::Helpers

  def site_name
    "NHL.com"
  end

  def description
    "Game Summary"
  end

  def url
    "http://www.nhl.com/scores/htmlreports/" \
    "#{season}/GS#{game_number_without_year}.HTM"
  end

  def group
    0
  end

  def position
    3
  end

end
