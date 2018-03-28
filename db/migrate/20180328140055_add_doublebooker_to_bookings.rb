class AddDoublebookerToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :doublebooker, :string
  end
end
