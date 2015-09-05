class Links::Game::HsGameStats < Links::Base

  def site_name
    "Hockey Stats"
  end

  def description
    "Game Statistics"
  end

  def url
    "http://hockeystats.ca/game/#{game.game_number}"
  end

  def group
    3
  end

  def position
    0
  end

end
