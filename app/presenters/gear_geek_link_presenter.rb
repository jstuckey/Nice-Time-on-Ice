# Constructs links to Gear Geek
class GearGeekLinkPresenter < LinkPresenterBase
  include LinkHelpers

  def names
    [
      "NHL Totals",
      "Brands",
      "Teams",
      "Forwards",
      "Defensemen",
      "Goalies",
      "Goals",
      "Salary Cap"
    ]
  end

  def links
    %W[
      https://www.geargeek.com/
      https://www.geargeek.com/brands
      https://www.geargeek.com/team/#{full_team_name}
      https://www.geargeek.com/position/forwards
      https://www.geargeek.com/position/defenseman
      https://www.geargeek.com/position/goalie
      https://www.geargeek.com/stats/goals
      https://www.geargeek.com/salary
    ]
  end
end
