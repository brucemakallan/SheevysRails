class AddTwinbookerToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :twinbooker, :string
  end
end
