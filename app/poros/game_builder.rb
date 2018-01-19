# Produces a Game record with all fields properly filled out
# Allows for a more lenient range of inputs when creating a game
#
# For example, we could set the teams using abbreviations and
# the season by using a year integer
class GameBuilder
  include Virtus.model
  include AliasAttribute

  attribute :year_start, Integer
  attribute :away_team, String
  attribute :home_team, String
  attribute :game_number, Integer
  attribute :date, Date
  attribute :is_playoffs, Boolean

  alias_attribute :season, :year_start
  alias_attribute :away, :away_team
  alias_attribute :home, :home_team
  alias_attribute :number, :game_number

  def to_game
    self.game = Game.new
    set_game_attributes
    game
  end

  private

  attr_accessor :game

  def set_game_attributes
    fix_team_names
    set_season
    set_away_team
    set_home_team
    set_game_number
    set_date
    set_playoffs
  end

  def fix_team_names
    self.away_team = away_team.tr("é", "e") if away_team.present?
    self.home_team = home_team.tr("é", "e") if home_team.present?
  end

  def set_season
    game.season = Season.where(year_start: year_start).first
  end

  def set_away_team
    game.away_team =
      Team.find_by_name(away_team) ||
      Team.find_by_abbreviation(away_team)
  end

  def set_home_team
    game.home_team =
      Team.find_by_name(home_team) ||
      Team.find_by_abbreviation(home_team)
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
