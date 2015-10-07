class Links::Game::NhlBoxscore < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Boxscore"
  end

  def url
    "http://www.nhl.com/ice/boxscore.htm?id=" \
    "#{game.game_number}"
  end

  def group
    0
  end

  def position
    0
  end

end
