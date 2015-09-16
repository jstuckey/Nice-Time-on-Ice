class RequestContext

  attr_reader :team, :season, :game_type, :game

  def initialize(params = {})
    @team      = determine_team(params[:team])
    @season    = determine_season(params[:season])
    @game_type = determine_game_type(params[:game_type])
    @game      = determine_game(params[:game])
  end

  private

  def determine_team(team)
    Team.find_by_id(team) ||
      Team.where(abbreviation: team).first ||
      Team.where(abbreviation: "WSH").first # Go Caps!
  end

  def determine_season(season)
    if season
      Season.find_by_id(season) ||
        Season.where(year_start: season).first
    else
      Season.last
    end
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

  def determine_game(game)
    Game.find_by_id(game) ||
      Game.where(game_number: game).first ||
      Game.where(season: season, playoffs: game_type == 3)
          .where("away_team_id = ? OR home_team_id = ?", team.id, team.id)
          .order(:date).last
  end

end
