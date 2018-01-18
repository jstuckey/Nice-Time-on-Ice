# API endpoints for game data
class ApiController < ApplicationController
  before_action :set_json_format, except: :index

  DOCUMENTATION_PATH = File.join(Rails.root, 'config', 'api_doc.yml')

  def index
    @documentation = Rails.cache.fetch("api_documentation_v1") do
      file = File.open(DOCUMENTATION_PATH)
      YAML.safe_load(file).deep_symbolize_keys
    end
  end

  def seasons
    seasons = Season.all
    render "api/seasons", locals: { seasons: seasons }
  end

  def season
    season = RequestContext.new(params).season
    render "api/_season", locals: { season: season }
  end

  def season_games
    season = RequestContext.new(params).season
    games = season.games
    render "api/games", locals: { games: games }
  end

  def season_game
    game = RequestContext.new(params).game
    render "api/_game", locals: { game: game }
  end

  def season_game_links
    render "api/links", locals: { links: [] }
  end

  def teams
    teams = Team.all
    render "api/teams", locals: { teams: teams }
  end

  def team
    team = RequestContext.new(params).team
    render "api/_team", locals: { team: team }
  end

  def team_seasons
    team = RequestContext.new(params).team
    seasons = team.seasons
    render "api/seasons", locals: { seasons: seasons }
  end

  def team_season
    season = RequestContext.new(params).season
    render "api/_season", locals: { season: season }
  end

  def team_season_links
    render "api/links", locals: { links: [] }
  end

  def games
    games = Game.all
    render "api/games", locals: { games: games }
  end

  def game
    game = RequestContext.new(params).game
    render "api/_game", locals: { game: game }
  end

  private

  def set_json_format
    request.format = :json
  end
end
