class AddSinglebookerToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :singlebooker, :string
  end
end
