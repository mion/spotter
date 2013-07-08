class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.string :credit_card, null: false
      t.string :holder_name, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.date :expires_at, null: false
      t.decimal :price, null: false
      t.references :user
      t.references :parking_lot

      t.timestamps
    end

    add_index :reservations, [:credit_card, :starts_at]
    add_index :reservations, [:user_id, :parking_lot_id, :starts_at]
  end

  def self.down
    drop_table :reservations
  end
end
