# Constructs links to Quant Hockey
class QuantHockeyLinkPresenter < LinkPresenterBase
  include LinkHelpers

  def names
    [
      "Team Stats",
      "Player Stats"
    ]
  end

  def links
    [team_stats_link, player_stats_link]
  end

  def team_stats_link
    "http://www.quanthockey.com/nhl/teams/" \
      "#{full_team_name}-players-" \
      "#{season.year_start}-" \
      "#{season.year_end.to_s[2, 2]}-" \
      "#{game_type == 3 ? 'playoff-' : ''}" \
      "nhl-stats.html"
  end

  def player_stats_link
    "http://www.quanthockey.com/nhl/seasons/" \
      "#{season.year_start}-#{season.year_end.to_s[2, 2]}-" \
      "nhl-players-" \
      "#{game_type == 3 ? 'playoff-' : ''}" \
      "stats.html"
  end
end
