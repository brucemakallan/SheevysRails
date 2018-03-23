class FormMailer < ApplicationMailer
	default from: 'sheevys.bnb@gmail.com'

	def send_email
		mail(to: "makallancg2@gmail.com", subject: 'New Sheevys Booking')
	end
end
