module LinkHelpers
  #
  # These are helper methods for various links.
  #
  # Some urls require some advanced manipulation of
  # game, season, and team params.
  #

  # rubocop:disable all
  def ha_team_number
    return unless team

    # Hockey Analysis uses this crazy id scheme
    case team.abbreviation
    when 'ANA' then 1
    when 'WPG' then 2
    when 'BOS' then 3
    when 'BUF' then 4
    when 'CAR' then 5
    when 'CGY' then 6
    when 'CHI' then 7
    when 'CBJ' then 8
    when 'COL' then 9
    when 'DAL' then 10
    when 'DET' then 11
    when 'EDM' then 12
    when 'FLA' then 13
    when 'LAK' then 14
    when 'MIN' then 15
    when 'MTL' then 16
    when 'NSH' then 17
    when 'NJD' then 18
    when 'NYI' then 19
    when 'NYR' then 20
    when 'OTT' then 21
    when 'PHI' then 22
    when 'ARI' then 23
    when 'PIT' then 24
    when 'SJS' then 25
    when 'STL' then 26
    when 'TBL' then 27
    when 'TOR' then 28
    when 'VAN' then 29
    when 'WSH' then 30
    end
  end
  # rubocop:enable all

  def alternate_team_abbreviation(team_param = nil)
    t = team_param || team
    return unless t
    abbreviation = t.abbreviation

    # Some sites use non-standard team abbreviations
    case abbreviation
    when "LAK" then "L.A"
    when "NJD" then "N.J"
    when "SJS" then "S.J"
    when "TBL" then "T.B"
    else abbreviation
    end
  end

  def nhl_numbers_team_abbreviation
    # NHL Numbers uses some non-standard abbreviations
    case team.abbreviation
    when "CBJ" then "CLB"
    when "NSH" then "NAS"
    when "WSH" then "WAS"
    else team.abbreviation
    end
  end

  def alternate_game_type
    return unless game_type

    if game_type == 3
      'p'
    else
      's'
    end
  end

  def full_text_game_type
    return unless game_type

    if game_type == 3
      "Playoffs"
    else
      "Regular"
    end
  end

  def game_number_without_year
    game.game_number.to_s[-6, 6]
  end

  def game_number_without_year_and_zero
    game.game_number.to_s[-5, 5]
  end

  def full_team_name
    team.name.downcase.tr(" ", "-").tr(".", "")
  end

  def team_nickname
    if team.abbreviation == "CBJ"
      team.name.split(" ").last(2).join.downcase
    else
      team.name.split(" ").last.downcase
    end
  end
end
