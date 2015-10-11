class Links::Season::NhlNumbersFreeAgents < Links::Base

  def site_name
    "NHL Numbers"
  end

  def description
    "Free Agents"
  end

  def url
    "http://stats.nhlnumbers.com/free_agents?" \
    "year=#{season.year_end}"
  end

  def group
    9
  end

  def position
    3
  end

end
