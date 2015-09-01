class Links::Season::HrRosterStats < Links::Base

  def site_name
    "Hockey-Reference"
  end

  def description
    "Roster and Statistics"
  end

  def url
    "http://www.hockey-reference.com/teams/" \
    "#{team.abbreviation}/#{season.year_end}.html"
  end

  def group
    1
  end

  def position
    0
  end

end
