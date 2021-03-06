# Constructs links to Cap Friendly
class CapFriendlyLinkPresenter < LinkPresenterBase
  include LinkHelpers

  # rubocop:disable MethodLength
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
    %W[
      https://www.capfriendly.com/teams/#{team.name.downcase.tr(" ", "")}
      https://www.capfriendly.com/signings
      https://www.capfriendly.com/transactions/recalls-reassignments
      https://www.capfriendly.com/transactions/injuries
      https://www.capfriendly.com/trades
      https://www.capfriendly.com/buyout_calculator
      https://www.capfriendly.com/browse/free-agents
      https://www.capfriendly.com/draft
      https://www.capfriendly.com/comparables
    ]
  end
  # rubocop:enable MethodLength
end
