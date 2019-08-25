class AddCountryIdTo < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :country_id, :integer
  end
end
