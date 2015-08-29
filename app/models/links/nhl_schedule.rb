class Links::NhlSchedule < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Schedule"
  end

  def url
    "http://www.nhl.com/ice/schedulebyseason.htm?" \
    "season=#{season}&gameType=#{game_type}&team=" \
    "#{team.abbreviation}&network=&venue="
  end

  def group
    0
  end

  def position
    0
  end
end
