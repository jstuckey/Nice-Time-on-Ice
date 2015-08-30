class Links::HrScheduleResults < Links::Base

  def site_name
    "Hockey-Reference"
  end

  def description
    "Schedule and Results"
  end

  def url
    "http://www.hockey-reference.com/teams/" \
    "#{team.abbreviation}/#{season.year_end}_games.html"
  end

  def group
    0
  end

  def position
    1
  end

end
