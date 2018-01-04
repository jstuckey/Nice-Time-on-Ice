class CapFriendlyLinkPresenter < LinkPresenterBase
  include LinkHelpers

  def names
    [
      "Cap Hits",
      "Signings",
      "Recalls and Assignments",
      "Injuries",
      "Trades",
      "Buyout Calculator",
      "Free Agents",
      "Draft Board",
      "Comparables"
    ]
  end

  def links
    %W(
      https://www.capfriendly.com/teams/#{team_nickname}
      https://www.capfriendly.com/signings
      https://www.capfriendly.com/transactions/recalls-reassignments
      https://www.capfriendly.com/transactions/injuries
      https://www.capfriendly.com/trades
      https://www.capfriendly.com/buyout_calculator
      https://www.capfriendly.com/browse/free-agents
      https://www.capfriendly.com/draft
      https://www.capfriendly.com/comparables
    )
  end
end
