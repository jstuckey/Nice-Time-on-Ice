class Links::Game::NulliShiftChart < Links::Base

  include Links::Helpers

  def site_name
    "Nullisecund"
  end

  def description
    "Shift Chart"
  end

  def url
    "http://nullisecund.us/nhl/toi.php?id=" \
    "#{game_number_without_year_and_zero}"
  end

  def group
    1
  end

  def position
    1
  end

end
