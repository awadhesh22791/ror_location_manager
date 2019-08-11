class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
