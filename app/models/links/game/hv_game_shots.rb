class Links::Game::HvGameShots < Links::Base

  include Links::Helpers

  def site_name
    "Hockey Viz"
  end

  def description
    "Game Shots"
  end

  def url
    "http://hockeyviz.com/img/game/shots/" \
    "#{season.year_start.to_s[2, 2]}" \
    "#{season.year_end.to_s[2, 2]}" \
    "/gameShots-" \
    "#{game.date.strftime "%Y-%m-%d"}-" \
    "#{game.game_number}-" \
    "#{away_abbreviation}at#{home_abbreviation}" \
    ".png"
  end

  def group
    5
  end

  def position
    0
  end

  private

  def away_abbreviation
    alternate_team_abbreviation(game.away_team)
  end

  def home_abbreviation
    alternate_team_abbreviation(game.home_team)
  end

end
