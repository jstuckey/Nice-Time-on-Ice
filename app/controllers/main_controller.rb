class MainController < ApplicationController

  def index
    @context               = RequestContext.new(params)
    @season_presenter      = SeasonPresenter.new(@context)
    @team_presenter        = TeamPresenter.new(@context)
    @game_presenter        = GamePresenter.new(@context)
    @season_link_presenter = ExternalLinkPresenter.new(@context, :season)
    @game_link_presenter   = ExternalLinkPresenter.new(@context, :game)
    @misc_link_presenter   = ExternalLinkPresenter.new(@context, :misc)
  end

end
