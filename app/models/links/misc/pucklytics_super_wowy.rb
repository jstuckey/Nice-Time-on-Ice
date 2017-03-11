class Links::Misc::PucklyticsSuperWowy < Links::Base

  def site_name
    "Pucklytics"
  end

  def description
    "Super WOWY"
  end

  def url
    "https://puckalytics.com/#/SuperWOWY?" \
      "startyear=#{season.year_start}&" \
      "startmonth=9&startday=1" \
      "&endyear=#{season.year_end}&" \
      "endmonth=4&endday=30&situation=5v5"
  end

  def group
    0
  end

  def position
    6
  end
end
