class GameBuilder
  include Virtus.model

  attribute :year_start, Integer
  attribute :game_number, Integer
  attribute :away_team_abbreviation, String
  attribute :home_team_abbreviation, String
  attribute :date, Date
  attribute :is_playoffs, Boolean

  def to_game
    self.game = Game.new
    set_game_attributes
    game
  end

  private

  attr_accessor :game

  def set_game_attributes
    set_season
    set_away_team
    set_home_team
    set_game_number
    set_date
    set_playoffs
  end

  def set_season
    game.season = Season.where(year_start: year_start).first
  end

  def set_away_team
    game.away_team = Team.where(abbreviation: away_team_abbreviation).first
  end

  def set_home_team
    game.home_team = Team.where(abbreviation: home_team_abbreviation).first
  end

  def set_game_number
    game.game_number = game_number
  end

  def set_date
    game.date = date
  end

  def set_playoffs
    game.playoffs = is_playoffs
  end

end
