# An implementation of the null object pattern for the Game model
# There might not always be available games depending on the request params
# For example, we request playoff games for a team that didn't make the playoffs
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

  # Allows calling an infinite chain of methods on the null object
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
