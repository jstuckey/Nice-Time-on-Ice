class Links::Misc::PucklyticsGoalieStats < Links::Base
  def site_name
    "Pucklytics"
  end

  def description
    "Goalie Stats"
  end

  def url
    "https://puckalytics.com/#/goalies?" \
      "season=#{season.year_start}" \
      "#{season.year_end.to_s[2, 2]}"
  end

  def group
    0
  end

  def position
    1
  end
end
