class Links::Game::NhlRecap < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Recap"
  end

  def url
    "http://www.nhl.com/ice/recap.htm?id=" \
    "#{game.game_number}"
  end

  def group
    0
  end

  def position
    1
  end

end
