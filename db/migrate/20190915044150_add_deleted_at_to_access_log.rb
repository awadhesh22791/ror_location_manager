class AddDeletedAtToAccessLog < ActiveRecord::Migration[5.2]
  def change
    add_column :access_logs, :deleted_at, :datetime
    add_index :access_logs, :deleted_at
  end
end
