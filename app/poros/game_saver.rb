class GameSaver
  attr_reader :games, :results

  def initialize(game_or_games)
    @games = Array(game_or_games)
    @results = []
  end

  def call
    save_games
    self
  end

  private

  attr_writer :results

  def save_games
    games.each do |game|
      attempt_to_save(game)
    end
  end

  def attempt_to_save(game)
    if game.save
      results << success_message(game)
    else
      attempt_to_update_date(game)
    end
  end

  def success_message(game)
   "Saved game #{game.game_number}"
  end

  def failure_message(game)
    "Error saving game #{game.game_number}: " \
      "#{game.errors.full_messages.join(". ")}"
  end
end

class UpdateGameDate
  def initialize(game)
    @game = game
  end

  private

  attr_reader :game

  def attempt_to_update_date(game)
    existing_game = Game.where(game_number: game.game_number).first
    if existing_game && existing_game.date < game.date
      existing_game.date = game.date
      if existing_game.save
        results << update_message(existing_game)
      else
        results << failure_message(existing_game)
      end
    else
      results << failure_message(game)
    end
  end

  def update_message(game)
    "Updated date for game #{game.game_number}"
  end

end
