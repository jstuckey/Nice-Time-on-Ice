class NhlLinkPresenter < LinkPresenterBase
  include LinkHelpers

  def names
    [
      "Boxscore",
      "Recap",
      "Ice Tracker",
      "Game Summary",
      "Event Summary",
      "Faceoff Summary",
      "Play-by-Play",
      "Home Time on Ice",
      "Away Time on Ice",
      "Playing Roster",
      "Shot Report",
      "Video Highlights",
      "Shift Chart",
      "Schedule",
      "Summary",
      "Goals",
      "Assists",
      "Points",
      "Plus/Minus",
      "Powerplay",
      "Penalty Kill",
      "Shootout",
      "Faceoffs",
      "Penalties",
      "Time on Ice",
      "Real Time",
      "Shooting",
      "Percentages",
      "Shooting/TOI",
      "Scoring",
      "Bios"
    ]
  end

  def links
    %W[
      http://www.nhl.com/ice/boxscore.htm?id=#{game.game_number}
      http://www.nhl.com/ice/recap.htm?id=#{game.game_number}
      http://www.nhl.com/ice/icetracker.htm?id=#{game.game_number}
      http://www.nhl.com/scores/htmlreports/#{season}/GS#{game_number_without_year}.HTM
      http://www.nhl.com/scores/htmlreports/#{season}/ES#{game_number_without_year}.HTM
      http://www.nhl.com/scores/htmlreports/#{season}/FC#{game_number_without_year}.HTM
      http://www.nhl.com/scores/htmlreports/#{season}/PL#{game_number_without_year}.HTM
      http://www.nhl.com/scores/htmlreports/#{season}/TH#{game_number_without_year}.HTM
      http://www.nhl.com/scores/htmlreports/#{season}/TV#{game_number_without_year}.HTM
      http://www.nhl.com/scores/htmlreports/#{season}/RO#{game_number_without_year}.HTM
      http://www.nhl.com/scores/htmlreports/#{season}/SS#{game_number_without_year}.HTM
      http://video.nhl.com/videocenter/embed?playlist=#{game.game_number}-X-h
      http://www.nhl.com/stats/shiftcharts?id=#{game.game_number}
      http://www.nhl.com/ice/schedulebyseason.htm?season=#{season}&gameType=#{game_type}&team=#{team.abbreviation}&network=&venue=
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=summary
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=goals
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=assists
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=points
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=plusminus
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=powerplay
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=penaltykill
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=shootout
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=faceoffs
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=penalties
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=timeonice
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=realtime
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=skatersummaryshooting
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=skaterpercentages
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=skatershootingtimeonice
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=skaterscoring
      http://www.nhl.com/stats/player?team=#{team.abbreviation}&season=#{season}&gameType=#{game_type}&report=bios
    ]
  end
end
