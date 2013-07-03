class CreateParkingLots < ActiveRecord::Migration
  def self.up
    create_table :parking_lots do |t|
      t.string :address, null: false
      t.integer :spots_total, null: false
      t.integer :spots_current, null:false, default: 0
      t.string :pricing, null: false
      t.string :schedule, null: false
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
      t.references :user

      t.timestamps
    end

    add_index :parking_lots, :address
    add_index :parking_lots, :pricing
  end

  def self.down
    drop_table :parking_lots
  end
end
