class Links::Misc::PonShots < Links::Base

  def site_name
    "Puck on Net"
  end

  def description
    "Shots"
  end

  def url
    "http://www.fenwick-stats.com/shots.php?" \
    "s=#{season.year_start}-10-01&e=#{season.year_end}-07-1&f=0&ld=1&l=82"
  end

  def group
    3
  end

  def position
    2
  end

end
