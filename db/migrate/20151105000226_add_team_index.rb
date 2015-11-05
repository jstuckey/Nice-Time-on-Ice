class AddTeamIndex < ActiveRecord::Migration
  def change
    add_index :teams, :abbreviation
  end
end
