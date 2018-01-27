class AddFullNameToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :full_name, :string, null: false, default: ""
    add_index :teams, :full_name
  end
end
