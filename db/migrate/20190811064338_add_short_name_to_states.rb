class AddShortNameToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :short_name, :string 
  end
end
