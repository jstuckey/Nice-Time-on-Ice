class Links::Game::NulliEvenStrengthShooting < Links::Base

  include Links::Helpers

  def site_name
    "Nullisecund"
  end

  def description
    "Even Strength Shooting"
  end

  def url
    "http://nullisecund.us/nhl/game.php?id=" \
    "#{game_number_without_year_and_zero}"
  end

  def group
    1
  end

  def position
    0
  end

end
