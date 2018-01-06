class SportracLinkPresenter < LinkPresenterBase
  include LinkHelpers

  def names
    [
      "Financial Summary",
      "Contracts",
      "Salary Cap Table",
      "Multi-Year Breakdown",
      "Positional Spending",
      "Free Agents",
      "Transactions",
      "Buyout Calculator"
    ]
  end

  def links
    %W[
      http://www.spotrac.com/nhl/#{full_team_name}
      http://www.spotrac.com/nhl/#{full_team_name}/contracts
      http://www.spotrac.com/nhl/#{full_team_name}/cap/#{season.year_start}
      http://www.spotrac.com/nhl/#{full_team_name}/yearly/cap/#{season.year_start}
      http://www.spotrac.com/nhl/#{full_team_name}/positional/#{season.year_start}
      http://www.spotrac.com/nhl/free-agents/#{season.year_start}/#{full_team_name}/ufa/
      http://www.spotrac.com/nhl/transactions/#{season.year_start}/#{full_team_name}
      http://www.spotrac.com/nhl/tools/buyout-calculator
    ]
  end
end
