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
      results << failure_message(game)
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
