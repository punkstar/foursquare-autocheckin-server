class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :ip_address
      t.date :created_at
      t.integer :device_id

      t.timestamps
    end
  end
end
