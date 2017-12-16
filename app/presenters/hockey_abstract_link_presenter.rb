class HockeyAbstractLinkPresenter < LinkPresenterBase
  def names
    [
      "Player Usage Charts",
      "Luck Calculator",
      "Other Data"
    ]
  end

  def links
    %W[
      http://www.hockeyabstract.com/playerusagecharts
      http://www.hockeyabstract.com/luck
      http://www.hockeyabstract.com/testimonials
    ]
  end
end
