class AddDeletedAtToState < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :deleted_at, :datetime
    add_index :states, :deleted_at
  end
end
