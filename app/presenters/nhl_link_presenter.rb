# Constructs links to NHL.com
# rubocop:disable ClassLength
class NhlLinkPresenter < LinkPresenterBase
  include LinkHelpers

  LINK_BASE = "http://www.nhl.com/".freeze

  # rubocop:disable MethodLength
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

  # rubocop:disable AbcSize
  def links
    [
      boxscore,
      recap,
      icetracker,
      game_summary,
      event_summary,
      faceoff_summary,
      play_by_play,
      home_time_on_ice,
      away_time_on_ice,
      playing_roster,
      shot_report,
      video_highlights,
      shift_chart,
      schedule,
      summary,
      goals,
      assists,
      points,
      plus_minus,
      powerplay,
      penalty_kill,
      shootout,
      faceoffs,
      penalties,
      time_on_ice,
      real_time,
      shooting,
      percentages,
      shooting_toi,
      scoring,
      bio
    ]
  end
  # rubocop:enable AbcSize
  # rubocop:enable MethodLength

  def boxscore
    "#{LINK_BASE}ice/boxscore.htm?id=#{game.game_number}"
  end

  def recap
    "#{LINK_BASE}ice/recap.htm?id=#{game.game_number}"
  end

  def icetracker
    "#{LINK_BASE}ice/icetracker.htm?id=#{game.game_number}"
  end

  def game_summary
    "#{LINK_BASE}scores/htmlreports/#{season}/GS#{game_number_without_year}.HTM"
  end

  def event_summary
    "#{LINK_BASE}scores/htmlreports/#{season}/ES#{game_number_without_year}.HTM"
  end

  def faceoff_summary
    "#{LINK_BASE}scores/htmlreports/#{season}/FC#{game_number_without_year}.HTM"
  end

  def play_by_play
    "#{LINK_BASE}scores/htmlreports/#{season}/PL#{game_number_without_year}.HTM"
  end

  def home_time_on_ice
    "#{LINK_BASE}scores/htmlreports/#{season}/TH#{game_number_without_year}.HTM"
  end

  def away_time_on_ice
    "#{LINK_BASE}scores/htmlreports/#{season}/TV#{game_number_without_year}.HTM"
  end

  def playing_roster
    "#{LINK_BASE}scores/htmlreports/#{season}/RO#{game_number_without_year}.HTM"
  end

  def shot_report
    "#{LINK_BASE}scores/htmlreports/#{season}/SS#{game_number_without_year}.HTM"
  end

  def video_highlights
    "http://video.nhl.com/videocenter/embed?playlist=#{game.game_number}-X-h"
  end

  def shift_chart
    "#{LINK_BASE}stats/shiftcharts?id=#{game.game_number}"
  end

  def schedule
    "#{LINK_BASE}ice/schedulebyseason.htm?season=#{season}&gameType=" \
      "#{game_type}&team=#{team.abbreviation}&network=&venue="
  end

  def summary
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=summary"
  end

  def goals
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=goals"
  end

  def assists
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=assists"
  end

  def points
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=points"
  end

  def plus_minus
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=plusminus"
  end

  def powerplay
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=powerplay"
  end

  def penalty_kill
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=penaltykill"
  end

  def shootout
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=shootout"
  end

  def faceoffs
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=faceoffs"
  end

  def penalties
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=penalties"
  end

  def time_on_ice
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=timeonice"
  end

  def real_time
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=realtime"
  end

  def shooting
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=skatersummaryshooting"
  end

  def percentages
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=skaterpercentages"
  end

  def shooting_toi
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=skatershootingtimeonice"
  end

  def scoring
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=skaterscoring"
  end

  def bio
    "#{LINK_BASE}stats/player?team=#{team.abbreviation}&season=#{season}&gameType=" \
      "#{game_type}&report=bios"
  end
end
# rubocop:enable ClassLength
