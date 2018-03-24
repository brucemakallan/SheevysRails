class CreateFeedbackMails < ActiveRecord::Migration[5.1]
  def change
    create_table :feedback_mails do |t|
      t.string :fullname
      t.string :email
      t.string :timeofstay
      t.integer :rating
      t.string :notes

      t.timestamps
    end
  end
end
