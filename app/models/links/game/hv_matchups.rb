class Links::Game::HvMatchups < Links::Base

  include Links::Helpers

  def site_name
    "Hockey Viz"
  end

  def description
    "Matchups"
  end

  def url
    "http://hockeyviz.com/img/game/matchups/" \
    "#{season.year_start.to_s[2, 2]}" \
    "#{season.year_end.to_s[2, 2]}" \
    "/matchups-" \
    "#{game.date.strftime "%Y-%m-%d"}-" \
    "#{game.game_number}-" \
    "#{away_abbreviation}at#{home_abbreviation}" \
    ".png"
  end

  def group
    5
  end

  def position
    1
  end

  private

  def away_abbreviation
    alternate_team_abbreviation(game.away_team)
  end

  def home_abbreviation
    alternate_team_abbreviation(game.home_team)
  end

end
