class GameBuilder
  include Virtus.model

  attribute :year_start, Integer
  attribute :game_number, Integer
  attribute :away_team_abbreviation, String
  attribute :home_team_abbreviation, String
  attribute :date, Date
  attribute :is_playoffs, Boolean

  def to_game
    game = Game.new
    game.season = Season.where(year_start: year_start).first
    game.away_team = Team.where(abbreviation: away_team_abbreviation).first
    game.home_team = Team.where(abbreviation: home_team_abbreviation).first
    game.game_number = game_number
    game.date = date
    game.playoffs = is_playoffs

    game
  end
end
