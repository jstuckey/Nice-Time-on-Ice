class AddSeasonIndex < ActiveRecord::Migration
  def change
    add_index :seasons, :year_start
    add_index :seasons, :year_end
  end
end
