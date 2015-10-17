require 'test_helper'

class GameScraperTest < ActiveSupport::TestCase

  test "::new should accept no arguments" do
    GameScraper.new
  end

  test "::new should accept a parser object" do
    parser = ParserFake.new("regular_season_in_past")
    GameScraper.new(parser: parser)
  end

  test "#url should set date and season based on constructor params" do
    date = Date.new(2015, 5, 15)
    scraper = GameScraper.new(date: date)

    expected = "http://www.nhl.com/ice/schedulebyday.htm?date=05/15/2015&season=20142015"

    assert_equal expected, scraper.url
  end

  test "no games scheduled" do
    parser = ParserFake.new("no_games")
    scraper = GameScraper.new(parser: parser)
    assert_equal [], scraper.call.games
  end

  test "regular season games in future" do
    date = Date.new(2014, 11, 21)
    parser = ParserFake.new("regular_season_in_future")
    scraper = GameScraper.new(date: date, parser: parser)
    games = scraper.call.games

    assert_equal 3, games.count
    game = games.last
    assert_equal 2014020294, game.game_number
    assert_equal teams(:devils), game.away_team
    assert_equal teams(:oilers), game.home_team
    assert_equal seasons(:fourteen), game.season
    assert_equal date, game.date
    refute game.playoffs?
  end

  test "regular season games in past" do
    date = Date.new(2014, 11, 20)
    parser = ParserFake.new("regular_season_in_past")
    scraper = GameScraper.new(date: date, parser: parser)
    games = scraper.call.games

    assert_equal 11, games.count
    game = games.last
    assert_equal 2014020290, game.game_number
    assert_equal teams(:cats), game.away_team
    assert_equal teams(:sharks), game.home_team
    assert_equal seasons(:fourteen), game.season
    assert_equal date, game.date
    refute game.playoffs?
  end

  test "playoff games" do
    date = Date.new(2015, 4, 27)
    parser = ParserFake.new("playoffs")
    scraper = GameScraper.new(date: date, parser: parser)
    games = scraper.call.games

    assert_equal 2, games.count
    game = games.last
    assert_equal 2014030147, game.game_number
    assert_equal teams(:islanders), game.away_team
    assert_equal teams(:caps), game.home_team
    assert_equal seasons(:fourteen), game.season
    assert_equal date, game.date
    assert game.playoffs?
  end

  test "winter classic" do
    date = Date.new(2015, 1, 1)
    parser = ParserFake.new("winter_classic")
    scraper = GameScraper.new(date: date, parser: parser)
    games = scraper.call.games

    assert_equal 2, games.count
    game = games.first
    assert_equal 2014020556, game.game_number
    assert_equal teams(:blackhawks), game.away_team
    assert_equal teams(:caps), game.home_team
    assert_equal seasons(:fourteen), game.season
    assert_equal date, game.date
    refute game.playoffs?
  end

  test "all star game" do
    parser = ParserFake.new("all_star_game")
    scraper = GameScraper.new(parser: parser)
    assert_equal [], scraper.call.games
  end

end

class ParserFake

  attr_reader :file_path

  def initialize(html_fixture_name)
    fixture_file = "#{html_fixture_name}.html"
    @file_path = File.join(Rails.root, "test/fixtures", fixture_file)
  end

  def call
    file = File.open file_path
    Nokogiri::HTML(file)
  end

end
