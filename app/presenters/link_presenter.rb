# Returns links presenters for all sites
class LinkPresenter
  attr_reader :context

  def initialize(context)
    @context = context
  end

  def nhl
    @nhl ||= NhlLinkPresenter.new(@context)
  end

  def corsica
    @corsica ||= CorsicaLinkPresenter.new(@context)
  end

  def hockey_viz
    @hockey_viz ||= HockeyVizLinkPresenter.new(@context)
  end

  def behind_the_net
    @btn ||= BehindTheNetLinkPresenter.new(@context)
  end

  def hockey_stats
    @hockey_stats ||= HockeyStatsLinkPresenter.new(@context)
  end

  def puckbase
    @puckbase ||= PuckbaseLinkPresenter.new(@context)
  end

  def natural_stat_trick
    @nst ||= NaturalStatTrickPresenter.new(@context)
  end

  def nullisecund
    @nullisecund ||= NullisecundLinkPresenter.new(@context)
  end

  def hockey_reference
    @hockey_reference ||= HockeyReferenceLinkPresenter.new(@context)
  end

  def cap_friendly
    @cap_friendly ||= CapFriendlyLinkPresenter.new(@context)
  end

  def quant_hockey
    @quant_hockey ||= QuantHockeyLinkPresenter.new(@context)
  end

  def sportrac
    @sportrac ||= SportracLinkPresenter.new(@context)
  end

  def hockey_abstract
    @hockey_abstract ||= HockeyAbstractLinkPresenter.new(@context)
  end

  def gear_geek
    @gear_geek ||= GearGeekLinkPresenter.new(@context)
  end

  def nhl_numbers
    @nhl_numbers ||= NhlNumbersLinkPresenter.new(@context)
  end

  def dobber_hockey
    @dobber_hockey ||= DobberHockeyLinkPresenter.new(@context)
  end

  def puck_on_net
    @puck_on_net ||= PuckOnNetLinkPresenter.new(@context)
  end

  def null
    @null ||= NullLinkPresenter.new(@context)
  end
end
