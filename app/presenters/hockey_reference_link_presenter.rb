# Constructs links to Hockey Reference
class HockeyReferenceLinkPresenter < LinkPresenterBase
  def names
    [
      "Roster and Statistics",
      "Schedule and Results",
      "Advanced Stats Finder"
    ]
  end

  def links
    %W[
      http://www.hockey-reference.com/teams/#{team.abbreviation}/#{season.year_end}_games.html
      http://www.hockey-reference.com/teams/#{team.abbreviation}/#{season.year_end}.html
      http://www.hockey-reference.com/play-index/tpbp_finder.cgi
    ]
  end
end
