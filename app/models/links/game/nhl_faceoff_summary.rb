class Links::Game::NhlFaceoffSummary < Links::Base

  include Links::Helpers

  def site_name
    "NHL.com"
  end

  def description
    "Faceoff Summary"
  end

  def url
    "http://www.nhl.com/scores/htmlreports/" \
    "#{season}/FC#{game_number_without_year}.HTM"
  end

  def group
    0
  end

  def position
    5
  end

end
