class Links::Misc::PucklyticsSkaterStats < Links::Base
  def site_name
    "Pucklytics"
  end

  def description
    "Skater Stats"
  end

  def url
    "https://puckalytics.com/#/skaters?" \
      "season=#{season.year_start}" \
      "#{season.year_end.to_s[2, 2]}"
  end

  def group
    0
  end

  def position
    0
  end
end
