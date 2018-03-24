class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.string :fullname
      t.string :phone
      t.string :datein
      t.string :dateout
      t.string :roomtype
      t.string :occupancy
      t.integer :adults
      t.integer :children

      t.timestamps
    end
  end
end
