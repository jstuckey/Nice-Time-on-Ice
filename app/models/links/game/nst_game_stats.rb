class Links::Game::NstGameStats < Links::Base

  include Links::Helpers

  def site_name
    "Natural Stat Trick"
  end

  def description
    "Game Statistics"
  end

  def url
    "http://naturalstattrick.com/game.php?" \
    "season=#{season}&game=#{game_number_without_year_and_zero}"
  end

  def group
    4
  end

  def position
    0
  end

end
