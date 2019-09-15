class CreateWhitelistedIp < ActiveRecord::Migration[5.2]
  def change
    create_table :whitelisted_ips do |t|
      t.string :ip
      t.timestamps
    end
  end
end
