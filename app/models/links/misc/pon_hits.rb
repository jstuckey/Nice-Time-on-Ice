class Links::Misc::PonHits < Links::Base

  def site_name
    "Puck on Net"
  end

  def description
    "Hits"
  end

  def url
    "http://www.fenwick-stats.com/hits.php?" \
    "s=#{season.year_start}-10-01&e=#{season.year_end}-07-1&f=0&ld=1&l=82"
  end

  def group
    4
  end

  def position
    3
  end

end
