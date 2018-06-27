class FormMailer < ApplicationMailer
	default from: 'sheevys.bnb@gmail.com'

	layout "mailer"

	def send_email(email)
		@email = email
		mail(to: "tinamugarra@sheevys.com", subject: "New Sheevys Booking")			
	end

	def send_feedback(feedback)
		@feedback = feedback
		mail(to: "tinamugarra@sheevys.com", subject: "Sheevys Feedback")
	end
end
