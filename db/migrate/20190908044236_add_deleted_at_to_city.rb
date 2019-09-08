class AddDeletedAtToCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :deleted_at, :datetime
    add_index :cities, :deleted_at
  end
end
