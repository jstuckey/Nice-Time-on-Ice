class RequestContext

  attr_reader :team, :season, :game_type, :game, :game_order

  def initialize(params = {})
    @team       = determine_team(params[:team])
    @season     = determine_season(params[:season])
    @game_type  = determine_game_type(params[:game_type])
    @game_order = determine_game_order(params[:game_order])
    @game       = determine_game(params[:game])
  end

  def to_hash
    {
      team: team.abbreviation,
      season: season.to_s,
      game: game.game_number.to_s,
      game_type: game_type.to_s,
      game_order: game_order
    }
  end

  private

  def determine_team(team)
    team_by_id(team) ||
      team_by_abbreviation(team) ||
      default_team
  end

  def team_by_id(possible_id)
    Team.find_by_id(possible_id)
  end

  def team_by_abbreviation(possible_abbreviation)
    Team.where(abbreviation: possible_abbreviation).first
  end

  def default_team
    # Go Caps!
    Team.where(abbreviation: "WSH").first
  end

  def determine_season(season)
    season_by_id(season) ||
      season_by_year_start(season) ||
      season_by_full_season_number(season) ||
      default_season
  end

  def season_by_id(possible_id)
    return unless possible_id
    Season.find_by_id(possible_id)
  end

  def season_by_year_start(possible_year)
    return unless possible_year
    Season.where(year_start: possible_year).first
  end

  def season_by_full_season_number(possible_season_number)
    return unless possible_season_number
    year_start = possible_season_number.to_s[0..3]
    season_by_year_start(year_start)
  end

  def default_season
    Season.last
  end

  def determine_game_type(type)
    if type.present?
      coerce_game_type(type)
    else
      default_game_type
    end
  end

  def coerce_game_type(type)
    if type.to_s.downcase =~ /playoff/
      3
    elsif type.to_i == 3
      3
    else
      2
    end
  end

  def default_game_type
    if playoffs_have_started?
      3
    else
      2
    end
  end

  def playoffs_have_started?
    Game.where(season: season, playoffs: true).count > 0
  end

  def determine_game(game)
    game_by_id(game) ||
      game_by_game_number(game) ||
      most_recent_game_in_season ||
      null_game
  end

  def game_by_id(possible_id)
    Game.find_by_id(possible_id)
  end

  def game_by_game_number(possible_game_number)
    Game.where(game_number: possible_game_number).first
  end

  def most_recent_game_in_season
    Game.where(season: season, playoffs: game_type == 3)
        .where("away_team_id = ? OR home_team_id = ?", team.id, team.id)
        .order(date: game_order).first
  end

  def null_game
    NullGame.new
  end

  def determine_game_order(order)
    if order.to_s.downcase == "asc"
      "asc"
    else
      "desc"
    end
  end

end
