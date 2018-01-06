class GameScraper
  attr_reader :date, :parser, :season, :url, :doc, :games

  def initialize(date: nil, parser: nil)
    @date = date || Date.today
    @season = season_from_date(@date)
    @url = "https://www.nhl.com/schedule/-/ET" \
      "?lazyloadStart=#{@date.strftime("%Y-%m-%d")}"
    @parser = parser || NhlParser.new(@url)
  end

  def call
    @games = []
    scrape_website
    return self if no_games_scheduled?
    return self unless game_rows
    parse_games
    log_parsed_games
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
    # If there are games for a given date, the
    # first date div on the page will match
    first_date_on_page = doc.css(".section-subheader").first
    return true unless first_date_on_page.present?
    first_date_on_page.text != date.strftime("%A, %b %-d")
  end

  def game_rows
    # The games for a given date are in the first table
    # on the page that has the 'day-table' class
    @game_rows ||= begin
      tables = doc.css("table.day-table")
      return unless tables
      tables.first.css("tbody tr")
    end
  end

  def parse_games
    game_rows.each do |row|
      games << game_from_row(row)
    end
    games.compact!
  end

  def log_parsed_games
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

  GAME_LINK_PATTERN = %r{\/gamecenter\/(?<game_number>[0-9]+)$}

  def year_start
    season[0, 4]
  end

  def game_number(row)
    # The game number is contained in an href
    # attribute of an <a> tag within the <tr>
    anchors = row.css("a.icon-label-link")
    anchors.each do |a|
      url = a.attribute("href")
      GAME_LINK_PATTERN.match(url) do |match|
        return match[:game_number]
      end
    end

    nil
  end

  def away_team(row)
    # The away team name is contained in a
    # title attribute of an <a> tag
    anchor = row.css(".away a").first
    return unless anchor.present?
    anchor.attribute("title").text
  end

  def home_team(row)
    # The home team name is contained in a
    # title attribute of the last <a> tag
    anchor = row.css(".home a").first
    return unless anchor.present?
    anchor.attribute("title").text
  end

  def playoffs?(game_number)
    # The sixth character in the game number
    # represents the game type e.g. 2 for
    # regular season and 3 for playoffs
    return unless game_number.present?
    game_number.to_s[5] == '3'
  end
end
