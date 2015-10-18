class Links::Misc::WoiSalaryInfo < Links::Base

  def site_name
    "War-on-Ice"
  end

  def description
    "Salary Information"
  end

  def url
    "http://war-on-ice.com/cap/" \
    "#{team.abbreviation}.html"
  end

  def group
    1
  end

  def position
    0
  end

end
