class Links::Season::SknSuperShotSearch < Links::Base

  def site_name
    "Some Kind of Ninja"
  end

  def description
    "Super Shot Search"
  end

  def url
    "http://somekindofninja.com/nhl/index.php?season=" \
    "#{game_type == "3" ? "Post" : "Regular"}&year=" \
    "#{season.year_start}-#{season.year_end}&shots=For" \
    "&team=#{team.name.tr(' ', '+')}&ice_player_name=" \
    "&withPlayer=On+Ice&player_name=&goalie_name=&event=" \
    "Shots+and+Goals&game=Away&strength=Even&time=" \
    "Regulation&search=Search"
  end

  def group
    4
  end

  def position
    1
  end

end
