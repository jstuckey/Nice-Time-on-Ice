class CorsicaLinkPresenter < LinkPresenterBase
  include LinkHelpers

  def names
    [
      "Game Stats",
      "Team Stats",
      "Skater Stats",
      "Goalie Stats",
      "Line Combinations",
      "Defence Pairings",
      "Player Profiles",
      "WAR",
      "Roster",
      "Predictions"
    ]
  end

  def links
    %W[
      http://corsica.hockey/games/?id=#{game.game_number}
      http://corsica.hockey/team-stats/?season=#{season.year_start}#{season.year_end}&session=#{full_text_game_type}
      http://corsica.hockey/skater-stats/?season=#{season.year_start}#{season.year_end}&session=#{full_text_game_type}&team=#{alternate_team_abbreviation}
      http://corsica.hockey/goalie-stats/?season=#{season.year_start}#{season.year_end}&session=#{full_text_game_type}&team=#{alternate_team_abbreviation}
      http://corsica.hockey/line-stats/?season=#{season.year_start}#{season.year_end}&session=#{full_text_game_type}&team=#{alternate_team_abbreviation}
      http://corsica.hockey/pairing-stats/?season=#{season.year_start}#{season.year_end}&session=#{full_text_game_type}&team=#{alternate_team_abbreviation}
      http://corsica.hockey/player-profiles/?player=ALEX.OVECHKIN
      http://corsica.hockey/war/?season=#{season.year_start}#{season.year_end}&team=#{alternate_team_abbreviation}
      http://corsica.hockey/team-rosters/?team=#{alternate_team_abbreviation}
      http://corsica.hockey/predictions/
    ]
  end
end
