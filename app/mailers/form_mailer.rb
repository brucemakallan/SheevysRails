class FormMailer < ApplicationMailer
	default from: 'sheevys.bnb@gmail.com'

	layout "mailer"

	@to_email_address = "makallancg2@gmail.com"

	def send_email(email)
		@email = email
		mail(to: @to_email_address, subject: "New Sheevys Booking")			
	end

	def send_feedback(feedback)
		@feedback = feedback
		mail(to: @to_email_address, subject: "Sheevys Feedback")
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
