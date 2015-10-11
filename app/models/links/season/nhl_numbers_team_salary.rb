class Links::Season::NhlNumbersTeamSalary < Links::Base

  include Links::Helpers

  def site_name
    "NHL Numbers"
  end

  def description
    "Team Salary"
  end

  def url
    "http://stats.nhlnumbers.com/teams/" \
    "#{nhl_numbers_team_abbreviation}?" \
    "year=#{season.year_end}"
  end

  def group
    9
  end

  def position
    0
  end

end
