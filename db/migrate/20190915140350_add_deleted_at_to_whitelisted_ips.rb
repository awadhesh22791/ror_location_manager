class AddDeletedAtToWhitelistedIps < ActiveRecord::Migration[5.2]
  def change
    add_column :whitelisted_ips, :deleted_at, :datetime
    add_index :whitelisted_ips, :deleted_at
  end
end
