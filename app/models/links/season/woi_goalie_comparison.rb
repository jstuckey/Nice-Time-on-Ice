class Links::Season::WoiGoalieComparison < Links::Base

  include Links::Helpers

  def site_name
    "War-on-Ice"
  end

  def description
    "Goaltender Comparison"
  end

  def url
   "http://war-on-ice.com/goalietable.html?" \
   "playoffs=#{full_text_game_type}&" \
   "start1=#{season.year_start}-10-01&" \
   "end1=#{season.year_end}-10-01"
  end

  def group
    5
  end

  def position
    2
  end

end
