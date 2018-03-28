class AddDeluxebookerToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :deluxebooker, :string
  end
end
