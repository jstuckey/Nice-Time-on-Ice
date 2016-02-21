class NullGame
  fields = %w(
    id
    game_number
    date
    playoffs
    season
    away_team
    home_team
    created_at
    updated_at
  )

  fields.each do |f|
    define_method(f) { BlackHole.new }
  end

  class BlackHole
    def method_missing(*)
      self
    end

    def to_s
      ""
    end
  end
  private_constant :BlackHole
end

