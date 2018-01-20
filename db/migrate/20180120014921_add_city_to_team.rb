class AddCityToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :city, :string, null: false, default: ""
  end
end
