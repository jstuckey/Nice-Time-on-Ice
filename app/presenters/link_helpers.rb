module LinkHelpers
  #
  # These are helper methods for various links.
  #
  # Some urls require some advanced manipulation of
  # game, season, and team params.
  #

  def alternate_team_abbreviation
    # Some sites use non-standard team abbreviations
    case team.abbreviation
    when "LAK" then "L.A"
    when "NJD" then "N.J"
    when "SJS" then "S.J"
    when "TBL" then "T.B"
    else team.abbreviation
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
