class Links::Base

  attr_reader :team, :season, :game, :game_type

  def initialize(team: nil, season: nil, game: nil, game_type: nil)
    @team      = determine_team(team)
    @season    = determine_season(season)
    @game      = determine_game(game)
    @game_type = determine_game_type(game_type)
  end

  # Override these methods in subclass

  def site_name
    raise "Override ##{__method__} method in subclass"
  end

  def description
    raise "Override ##{__method__} method in subclass"
  end

  def url
    raise "Override ##{__method__} method in subclass"
  end

  def group
    raise "Override ##{__method__} method in subclass"
  end

  def position
    raise "Override ##{__method__} method in subclass"
  end

  private

  def determine_team(team)
    return unless team
    Team.find_by_id(team) || Team.where(abbreviation: team).first
  end

  def determine_season(season)
    if season
      Season.find_by_id(season) || Season.where(year_start: season).first
    else
      Season.last
    end
  end

  def determine_game(game)
    return unless game
    Game.find_by_id(game) || Game.where(game_number: game).first
  end

  def determine_game_type(type)
    if type.to_s.downcase =~ /playoff/
      3
    elsif type.to_i == 3
      3
    else
      2
    end
  end

end
