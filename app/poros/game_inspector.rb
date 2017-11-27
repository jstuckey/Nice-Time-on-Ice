class GameInspector
  def initialize(year_start)
    @year_start = year_start
    @missing_list = []
  end

  def missing_games
    compare(actual_regular_season_game_numbers,
            ideal_regular_season_game_numbers)
    missing_list
  end

  private

  attr_reader :year_start, :missing_list

  def compare(actual_list, ideal_list)
    until actual_list.empty?
      actual = actual_list.shift.to_i
      ideal  = ideal_list.shift.to_i
      next if actual == ideal

      missing_list << ideal
      actual_list.unshift(actual)
    end
  end

  def ideal_regular_season_game_numbers
    min_game_number = "#{year_start}020001"
    max_game_number = "#{year_start}029999"
    (min_game_number..max_game_number).to_a
  end

  def actual_regular_season_game_numbers
    Season.where(year_start: year_start)
          .first.games
          .where(playoffs: false)
          .order(:game_number)
          .pluck(:game_number)
  rescue
    []
  end

  def actual_post_season_game_numbers
    Season.where(year_start: year_start)
          .first.games
          .where(playoffs: true)
          .order(:game_number)
          .pluck(:game_number)
  rescue
    []
  end

end
