class CreateParkingLots < ActiveRecord::Migration
  def self.up
    create_table :parking_lots do |t|
      t.string :address, null: false
      t.integer :spots_total, null: false
      t.integer :spots_current, null:false, default: 0
      t.string :pricing, null: false
      t.string :schedule, null: false
      t.references :user

      t.timestamps
    end

    add_index :parking_lots, [:address, :pricing, :schedule]
  end

  def self.down
    drop_table :parking_lots
  end
end
