class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.string :credit_card
      t.datetime :starts_at
      t.datetime :ends_at
      t.decimal :price
      t.references :user
      t.references :parking_lot

      t.timestamps
    end
    add_index :reservations, [:credit_card, :starts_at]
  end

  def self.down
    drop_table :reservations
  end
end
