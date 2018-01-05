class MainController < ApplicationController
  before_action :read_team_cookie
  after_action :write_team_cookie

  def index
    @context               = RequestContext.new(params)
    @season_presenter      = SeasonPresenter.new(@context)
    @team_presenter        = TeamPresenter.new(@context)
    @game_presenter        = GamePresenter.new(@context)
    @cache_key             = CacheKey.new(@context).value
    @nhl_link_presenter = NhlLinkPresenter.new(@context)
    @corsica_link_presenter = CorsicaLinkPresenter.new(@context)
    @hockey_viz_link_presenter = HockeyVizLinkPresenter.new(@context)
    @btn_link_presenter = BehindTheNetLinkPresenter.new(@context)
    @hockey_stats_link_presenter = HockeyStatsLinkPresenter.new(@context)
    @puckbase_link_presenter = PuckbaseLinkPresenter.new(@context)
    @nst_link_presenter = NaturalStatTrickPresenter.new(@context)
    @nullisecund_link_presenter = NullisecundLinkPresenter.new(@context)
    @hockey_reference_link_presenter = HockeyReferenceLinkPresenter.new(@context)
    @cap_friendly_link_presenter = CapFriendlyLinkPresenter.new(@context)
    @quant_hockey_link_presenter = QuantHockeyLinkPresenter.new(@context)
    @sportrac_link_presenter = SportracLinkPresenter.new(@context)
    @hockey_abstract_link_presenter = HockeyAbstractLinkPresenter.new(@context)
    @gear_geek_link_presenter = GearGeekLinkPresenter.new(@context)
    @nhl_numbers_link_presenter = NhlNumbersLinkPresenter.new(@context)
    @dobber_hockey_link_presenter = DobberHockeyLinkPresenter.new(@context)
    @puck_on_net_link_presenter = PuckOnNetLinkPresenter.new(@context)

    @null_link_presenter = NullLinkPresenter.new(@context)
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
