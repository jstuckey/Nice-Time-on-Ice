class NaturalStatTrickPresenter < LinkPresenterBase
  include LinkHelpers

  def names
    ["Game Statistics"]
  end

  def links
    [
    "http://naturalstattrick.com/game.php?" \
      "season=#{season}&game=#{game_number_without_year_and_zero}"
    ]
  end
end
