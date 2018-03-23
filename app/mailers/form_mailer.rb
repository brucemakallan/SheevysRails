class FormMailer < ApplicationMailer
	default from: 'sheevys.bnb@gmail.com'

	layout "mailer"

	def send_email
		mail(to: "makallancg2@gmail.com", subject: 'New Sheevys Booking', body: 'Sample body')
	end
end
