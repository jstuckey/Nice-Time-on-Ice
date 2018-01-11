class SportracLinkPresenter < LinkPresenterBase
  include LinkHelpers

  LINK_BASE = "http://www.spotrac.com/nhl/".freeze

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
    [
      financial_summary,
      contracts,
      salary_cap,
      multi_year_breakdown,
      positional_spending,
      free_agents,
      transactions,
      buyout_calculator
    ]
  end

  def financial_summary
    "#{LINK_BASE}#{full_team_name}"
  end

  def contracts
    "#{LINK_BASE}#{full_team_name}/contracts"
  end

  def salary_cap
    "#{LINK_BASE}#{full_team_name}/cap/#{season.year_start}"
  end

  def multi_year_breakdown
    "#{LINK_BASE}#{full_team_name}/yearly/cap/#{season.year_start}"
  end

  def positional_spending
    "#{LINK_BASE}#{full_team_name}/positional/#{season.year_start}"
  end

  def free_agents
    "#{LINK_BASE}free-agents/#{season.year_start}/#{full_team_name}/ufa/"
  end

  def transactions
    "#{LINK_BASE}transactions/#{season.year_start}/#{full_team_name}"
  end

  def buyout_calculator
    "#{LINK_BASE}tools/buyout-calculator"
  end
end
