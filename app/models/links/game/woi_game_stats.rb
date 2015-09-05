class Links::Game::WoiGameStats < Links::Base

  include Links::Helpers

  def site_name
    "War-on-Ice"
  end

  def description
    "Game Statistics"
  end

  def url
    "http://war-on-ice.com/game.html?seasongcode=" \
    "#{season}#{game_number_without_year_and_zero}"
  end

  def group
    2
  end

  def position
    0
  end

end
