class Links::Season::NhlNumbersPlayerSalaries < Links::Base

  def site_name
    "NHL Numbers"
  end

  def description
    "Player Salaries"
  end

  def url
    "http://stats.nhlnumbers.com/players?" \
    "year=#{season.year_end}"
  end

  def group
    9
  end

  def position
    1
  end

end
