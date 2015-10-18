class Links::Misc::HcapCapHit < Links::Base

  include Links::Helpers

  def site_name
    "Hockey's Cap"
  end

  def description
    "Cap Hits"
  end

  def url
    "https://hockeyscap.com/teams/#{team_nickname}"
  end

  def group
    8
  end

  def position
    0
  end

end
