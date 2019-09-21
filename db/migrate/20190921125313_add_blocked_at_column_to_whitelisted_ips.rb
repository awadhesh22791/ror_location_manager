class AddBlockedAtColumnToWhitelistedIps < ActiveRecord::Migration[5.2]
  def change
    add_column :whitelisted_ips, :blocked, :boolean,:default=>false
  end
end
