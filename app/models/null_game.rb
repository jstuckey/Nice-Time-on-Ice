class NullGame
  include Falsey

  fields = %w[
    id
    game_number
    date
    playoffs
    season
    away_team
    home_team
    created_at
    updated_at
  ]

  fields.each do |f|
    define_method(f) { BlackHole.new }
  end

  class BlackHole < BasicObject
    include ::Falsey

    def method_missing(*)
      self || super
    end

    def respond_to_missing?(*)
      true || super
    end
  end
  private_constant :BlackHole
end
