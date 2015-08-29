require 'csv'

class GameCSVImporter

  HEADER_YEAR        = 'year'
  HEADER_GAME_NUMBER = 'game_number'
  HEADER_AWAY_TEAM   = 'away_team'
  HEADER_HOME_TEAM   = 'home_team'
  HEADER_GAME_DATE   = 'game_date'
  HEADER_IS_PLAYOFFS = 'is_playoffs'

  attr_reader :file_path, :success_count, :failure_count

  def initialize(file_path)
    @file_path = file_path
    @success_count = 0
    @failure_count = 0
  end

  def import
    CSV.foreach(file_path, headers: true) do |row|
      data = extract_data(row)
      game = data.to_game
      attempt_to_save(game)
    end

    log_results
  end

  private

  def extract_data(row)
    GameBuilder.new(year_start: row[HEADER_YEAR],
                    game_number: row[HEADER_GAME_NUMBER],
                    away_team_abbreviation: row[HEADER_AWAY_TEAM],
                    home_team_abbreviation: row[HEADER_HOME_TEAM],
                    date: row[HEADER_GAME_DATE],
                    is_playoffs: row[HEADER_IS_PLAYOFFS])
  end

  def attempt_to_save(game)
    if game.save
      log_success(game)
    else
      log_failure(game)
    end
  end

  def log_success(game)
    @success_count += 1
    log "Created game #{game}"
  end

  def log_failure(game)
    @failure_count += 1
    log "Failed to create game #{game.errors.join(', ')}"
  end

  def log_results
    log "Created #{success_count} games. Failed to create #{failure_count} games."
  end

  def log(message)
    if Rails.env.test?
    elsif Rails.env.production?
    else
      puts message
    end
  end
end
