class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :booking_date
      t.boolean :deluxe_room
      t.boolean :double_room
      t.boolean :single_room
      t.boolean :twin_room

      t.timestamps
    end
  end
end
