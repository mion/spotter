class CreateParkingLots < ActiveRecord::Migration
  def self.up
    create_table :parking_lots do |t|
      t.string :address
      t.integer :spots_total
      t.integer :spots_current
      t.string :pricing
      t.string :schedule
      t.references :user

      t.timestamps
    end

    add_index :parking_lots, [:address, :pricing, :schedule]
  end

  def self.down
    drop_table :parking_lots
  end
end
