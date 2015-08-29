class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :year_start
      t.integer :year_end

      t.timestamps null: false
    end
  end
end
