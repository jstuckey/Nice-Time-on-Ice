class NhlNumbersLinkPresenter < LinkPresenterBase
  include LinkHelpers

  def names
    [
      "Team Salary",
      "Player Salaries",
      "Player Stats",
      "Free Agents"
    ]
  end

  def links
    %W(
      http://stats.nhlnumbers.com/teams/#{nhl_numbers_team_abbreviation}?year=#{season.year_end}
      http://stats.nhlnumbers.com/players?year=#{season.year_end}
      http://stats.nhlnumbers.com/player_stats/year/#{season.year_end}
      http://stats.nhlnumbers.com/free_agents?year=#{season.year_end}
    )
  end
end
