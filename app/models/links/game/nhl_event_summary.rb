class Links::Game::NhlEventSummary < Links::Base

  include Links::Helpers

  def site_name
    "NHL.com"
  end

  def description
    "Event Summary"
  end

  def url
    "http://www.nhl.com/scores/htmlreports/" \
    "#{season}/ES#{game_number_without_year}.HTM"
  end

  def group
    0
  end

  def position
    4
  end

end
