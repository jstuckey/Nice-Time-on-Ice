class GameScraper

  attr_reader :date, :parser, :season, :url, :doc, :games

  def initialize(date: nil, parser: nil)
    @date = date || Date.today
    @season = season_from_date(@date)
    @url = "http://www.nhl.com/ice/schedulebyday.htm?" \
           "date=#{@date.strftime("%m/%d/%Y")}&" \
           "season=#{@season}"
    @parser = parser || NhlParser.new(@url)
  end

  def call
    @games = []
    @doc = parser.call

    return self if no_games_scheduled?
    return self unless games_table

    games_table.each do |row|
      games << game_from_row(row)
    end
    games.compact!

    self
  end

  private

  def season_from_date(date)
    if date.month >= 10
      "#{date.year}#{date.year + 1}"
    else
      "#{date.year - 1}#{date.year}"
    end
  end

  def no_games_scheduled?
    doc.css("#noGamesScheduled").present?
  end

  def games_table
    @games_table ||= begin
      tables = doc.css("table.schedTbl")
      return unless tables
      tables.last.css("tbody tr")
    end
  end

  def game_from_row(row)
    year_start = season[0, 4]
    game_number = get_game_number(row)
    away_team = get_away_team(row)
    home_team = get_home_team(row)
    is_playoffs = is_playoffs?(game_number)

    return if year_start.nil?  ||
              game_number.nil? ||
              away_team.nil?   ||
              home_team.nil?   ||
              is_playoffs.nil?

    GameBuilder.new(year_start: year_start,
                    game_number: game_number,
                    away_team_abbreviation: away_team,
                    home_team_abbreviation: home_team,
                    date: date,
                    is_playoffs: is_playoffs)
              .to_game
  end

  GAME_LINK_PATTERN = /\?id=(?<game_number>[0-9]+)$/

  def get_game_number(row)
    # The game number is contained in an href
    # attribute of an <a> tag with the <tr>
    anchors = row.css("a.btn")
    anchors.each do |a|
      url = a.attribute("href")
      if match = GAME_LINK_PATTERN.match(url)
        return match[:game_number]
      end
    end

    nil
  end

  def get_away_team(row)
    # The away team abbreviation is contained in
    # a rel attribute of the first <a> tag with
    # a teamName class
    anchors = row.css(".teamName a")
    return unless anchors.present?
    anchors.first.attribute("rel")
  end

  def get_home_team(row)
    # The home team abbreviation is contained in
    # a rel attribute of the first <a> tag with
    # a teamName class
    anchors = row.css(".teamName a")
    return unless anchors.present?
    anchors.last.attribute("rel")
  end

  def is_playoffs?(game_number)
    # The sixth character in the game number
    # represents the game type e.g. 2 for
    # regular season and 3 for playoffs
    return unless game_number.present?
    game_number.to_s[5] == '3'
  end

end
