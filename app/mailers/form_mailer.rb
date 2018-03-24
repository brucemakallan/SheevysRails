class FormMailer < ApplicationMailer
	default from: 'sheevys.bnb@gmail.com'

	layout "mailer"

	def send_email(email)
		@email = email
		mail(to: "makallancg2@gmail.com", subject: "New Sheevys Booking")			
	end
end

# body: "Full name: #{email.fullname}
# 			Phone #{email.phone}
# 			Check-in Date #{email.datein}
# 			Check-out Date #{email.dateout}
# 			Room-Type #{email.roomtype}
# 			Occupancy #{email.occupancy}
# 			Adults #{email.adults}
# 			Children #{email.children}")
