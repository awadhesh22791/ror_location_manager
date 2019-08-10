class AddDeletedAtToCountry < ActiveRecord::Migration[5.2]
  def change
    add_column :countries, :deleted_at, :datetime
    add_index :countries, :deleted_at
  end
end
