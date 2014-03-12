class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :mac_address

      t.timestamps
    end
    add_index :devices, :mac_address, unique: true
  end
end
