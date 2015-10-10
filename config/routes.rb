Rails.application.routes.draw do

  # Main site
  root 'main#index'
  get 'main/index'

  # API
  get 'api/seasons',                           to: 'api#seasons'
  get 'api/seasons/:season',                   to: 'api#season'
  get 'api/seasons/:season/games',             to: 'api#season_games'
  get 'api/seasons/:season/games/:game',       to: 'api#season_game'
  get 'api/seasons/:season/games/:game/links', to: 'api#season_game_links'
  get 'api/teams',                             to: 'api#teams'
  get 'api/teams/:team',                       to: 'api#team'
  get 'api/teams/:team/seasons',               to: 'api#team_seasons'
  get 'api/teams/:team/seasons/:season',       to: 'api#team_season'
  get 'api/teams/:team/seasons/:season/links', to: 'api#team_season_links'
  get 'api/games',                             to: 'api#games'
  get 'api/games/:game',                       to: 'api#game'

end
