class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string :request_params
      t.string :request_context
      t.timestamps null: false
    end
  end
end
