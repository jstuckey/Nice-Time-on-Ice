# Saves or updates one or more games (or reports failure)
# Used when scraping the NHL.com schedule page
#
# Used the Chain of Responsibility design pattern for fun
class GameSaver
  attr_reader :games, :results

  def initialize(game_or_games)
    @games = Array(game_or_games)
    @results = []
    @game_saver = assemble_save_steps
  end

  def call
    save_games
    self
  end

  private

  attr_reader :game_saver

  def assemble_save_steps
    SaveGame.new(
      UpdateGameDate.new(
        ReportFailure.new(nil)
      )
    )
  end

  attr_writer :results

  def save_games
    games.each do |game|
      results << game_saver.call(game)
    end
  end

  # Parent class for steps in the Chain of Responsibility
  # If the step succeeeds, it returns a message
  # If the step fails, it calls the next step
  class Step
    attr_reader :game, :next_step

    def initialize(next_step)
      @next_step = next_step
    end

    def call(game)
      @game = game
      if perform_step
        message
      else
        next_step.call(game)
      end
    end

    private

    def perform_step
      raise "override #perform_step in subclass"
    end

    def message
      raise "override #message in subclass"
    end
  end

  # Attempts to save a game
  class SaveGame < Step
    def perform_step
      game.save
    end

    def message
      "Saved game #{game.game_number}"
    end
  end

  # Attempts to update a game
  class UpdateGameDate < Step
    def perform_step
      existing_game = Game.find_by_game_number(game.game_number)
      return unless existing_game.present?
      existing_game.date = Date.current
      existing_game.save
    end

    def message
      "Updated date for game #{game.game_number}"
    end
  end

  # Last step - returns and error message
  class ReportFailure < Step
    def perform_step
      true
    end

    def message
      "Error saving game #{game.game_number}: " \
        "#{game.errors.full_messages.join(". ")}"
    end
  end
end
