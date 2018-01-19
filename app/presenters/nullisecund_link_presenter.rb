# Constructs links to Nullisecund
class NullisecundLinkPresenter < LinkPresenterBase
  include LinkHelpers

  def names
    [
      "Even Strength Shooting",
      "Shift Chart"
    ]
  end

  def links
    %W[
      http://nullisecund.us/nhl/game.php?id=#{game_number_without_year_and_zero}
      http://nullisecund.us/nhl/toi.php?id=#{game_number_without_year_and_zero}
    ]
  end
end
