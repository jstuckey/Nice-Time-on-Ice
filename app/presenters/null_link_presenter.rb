# A null object for a link presenter
# Can stand in for a not-yet-implemented link presenter
class NullLinkPresenter < LinkPresenterBase
  def names
    []
  end

  def links
    []
  end
end
