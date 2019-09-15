class CreateAccessLog < ActiveRecord::Migration[5.2]
  def change
    create_table :access_logs do |t|
      t.string :module_name
      t.string :ip
      t.timestamps
    end
  end
end
