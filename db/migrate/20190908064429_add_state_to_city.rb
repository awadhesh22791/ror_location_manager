class AddStateToCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :state_id, :integer
  end
end
