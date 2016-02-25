class MainController < ApplicationController

  before_filter :read_team_cookie
  after_filter :write_team_cookie
  after_filter :add_stats

  def index
    @context               = RequestContext.new(params)
    @season_presenter      = SeasonPresenter.new(@context)
    @team_presenter        = TeamPresenter.new(@context)
    @game_presenter        = GamePresenter.new(@context)
    @season_link_presenter = ExternalLinkPresenter.new(@context, :season)
    @game_link_presenter   = ExternalLinkPresenter.new(@context, :game)
    @misc_link_presenter   = ExternalLinkPresenter.new(@context, :misc)
  end

  private

  def read_team_cookie
    return if params[:team].present?
    params[:team] = cookies[:team]
  end

  def write_team_cookie
    cookies[:team] = @context.team.abbreviation
  end

  def add_stats
    Stat.create(request_params: params.symbolize_keys,
                request_context: @context.to_hash)
  end
end
