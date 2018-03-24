class FormMailer < ApplicationMailer
	default from: 'sheevys.bnb@gmail.com'

	layout "mailer"

	def send_email(name:, phone:, datein:, dateout:, roomtype:, occupancy:, adults:, children:)
		mail(to: "makallancg2@gmail.com", 
			subject: 'New Sheevys Booking', 
			body: "Full name: #{name}<br>
			Phone #{phone}<br>
			Check-in Date #{datein}<br>
			Check-out Date #{dateout}<br>
			Room-Type #{roomtype}<br>
			Occupancy #{occupancy}<br>
			Adults #{adults}<br>
			Children #{children}")
	end
end
