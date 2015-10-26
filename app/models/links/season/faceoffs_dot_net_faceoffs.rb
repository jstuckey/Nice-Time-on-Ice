class Links::Season::FaceoffsDotNetFaceoffs < Links::Base

  def site_name
    "Faceoffs.net"
  end

  def description
    "Faceoffs"
  end

  def url
    "http://faceoffs.net/team/#{team.abbreviation}?year=" \
    "#{season.year_start}-#{season.year_end.to_s[2, 2]}"
  end

  def group
    6
  end

  def position
    0
  end

end
