# Constructs links to Shift Chart
class ShiftChartLinkPresenter < LinkPresenterBase
  include LinkHelpers
  def names
    ["Shift Chart"]
  end

  def links
    [shift_chart]
  end

  def shift_chart
    "http://www.shiftchart.com/game/" \
      "#{game.date.strftime("%Y-%m-%d")}-" \
      "#{game.away_team.name.downcase.tr(" ", "-")}-" \
      "#{game.home_team.name.downcase.tr(" ", "-")}"
  end
end
