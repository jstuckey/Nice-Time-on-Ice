class GameScraper

  attr_reader :date, :parser, :season, :url, :doc, :games

  def initialize(date: nil, parser: nil)
    @date = date || Date.today
    @season = season_from_date(@date)
    @url = "https://www.nhl.com/schedule/#{@date.strftime("%Y-%m-%d")}"
    @parser = parser || NhlParser.new(@url)
  end

  def call
    @games = []
    scrape_website
    return self if no_games_scheduled?
    return self unless games_table
    parse_games
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

  def scrape_website
    message = "Scraping #{url}"
    puts message unless Rails.env.test?
    Rails.logger.info message

    @doc = parser.call
  end

  def no_games_scheduled?
    doc.css("#noGamesScheduled").present?
  end

  def games_table
    @games_table ||= begin
      tables = doc.css("table.day-table")
      return unless tables
      tables.last.css("tbody tr")
    end
  end

  def parse_games
    games_table.each do |row|
      games << game_from_row(row)
    end
    games.compact!

    message = "#{games.length} games found"
    puts message unless Rails.env.test?
    Rails.logger.info message
  end

  def game_from_row(row)
    game_attrs = game_attribute_hash(row)
    return if game_attrs.values.any?(&:nil?)
    GameBuilder.new(game_attrs).to_game
  end

  def game_attribute_hash(row)
    game_number = game_number(row)
    {
      year_start: year_start,
      game_number: game_number,
      away_team: away_team(row),
      home_team: home_team(row),
      date: date,
      is_playoffs: playoffs?(game_number)
    }
  end

  GAME_LINK_PATTERN = /\/gamecenter\/(?<game_number>[0-9]+)$/

  def year_start
    season[0, 4]
  end

  def game_number(row)
    # The game number is contained in an href
    # attribute of an <a> tag within the <tr>
    anchors = row.css("a.icon-label-link")
    anchors.each do |a|
      url = a.attribute("href")
      if match = GAME_LINK_PATTERN.match(url)
        return match[:game_number]
      end
    end

    nil
  end

  def away_team(row)
    # The away team abbreviation is contained in
    # a rel attribute of the first <a> tag with
    # a teamName class
    anchors = row.css(".narrow-matchup__team a")
    return unless anchors.present?
    anchors.first.text
  end

  def home_team(row)
    # The home team abbreviation is contained in
    # a rel attribute of the last <a> tag with a
    # teamName class
    anchors = row.css(".narrow-matchup__team a")
    return unless anchors.present?
    anchors.last.text
  end

  def playoffs?(game_number)
    # The sixth character in the game number
    # represents the game type e.g. 2 for
    # regular season and 3 for playoffs
    return unless game_number.present?
    game_number.to_s[5] == '3'
  end

end
