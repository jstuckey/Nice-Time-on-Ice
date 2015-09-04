class Links::Game::NhlShotReport < Links::Base

  include Links::Helpers

  def site_name
    "NHL.com"
  end

  def description
    "Shot Report"
  end

  def url
    "http://www.nhl.com/scores/htmlreports/" \
    "#{season}/SS#{game_number_without_year}.HTM"
  end

  def group
    0
  end

  def position
    10
  end

end
