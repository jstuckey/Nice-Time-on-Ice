class Links::Season::SportracPayroll < Links::Base

  include Links::Helpers

  def site_name
    "Sportrac"
  end

  def description
    "Team Payroll"
  end

  def url
    "http://www.spotrac.com/nhl/" \
    "#{full_team_name}/cap/#{season.year_start}/"
  end

  def group
    7
  end

  def position
    0
  end

end
