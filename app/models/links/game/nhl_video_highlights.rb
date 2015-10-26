class Links::Game::NhlVideoHighlights < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Video Highlights"
  end

  def url
    "http://video.nhl.com/videocenter/embed?playlist=" \
    "#{game.game_number}-X-h"
  end

  def group
    0
  end

  def position
    11
  end

end
