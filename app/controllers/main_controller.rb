class MainController < ApplicationController
  before_action :read_team_cookie
  after_action :write_team_cookie

  def index
    @context = RequestContext.new(params)
    @season_presenter = SeasonPresenter.new(@context)
    @team_presenter = TeamPresenter.new(@context)
    @game_presenter = GamePresenter.new(@context)
    @link_presenter = LinkPresenter.new(@context)
    @cache_key = CacheKey.new(@context).value
  end

  private

  def read_team_cookie
    return if params[:team].present?
    params[:team] = cookies[:team]
  end

  def write_team_cookie
    cookies[:team] = @context.team.abbreviation
  end
end
