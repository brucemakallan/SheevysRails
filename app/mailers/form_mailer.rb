class FormMailer < ApplicationMailer
	default from: 'sheevys.bnb@gmail.com'

	layout "mailer"

	def send_email(email)
		@email = email
		# mail(to: "tinamugarra@sheevys.com", subject: "New Sheevys Booking")			
		mail(to: "brucemakallan@gmail.com", subject: "New Sheevys Booking")			
	end

	def send_feedback(feedback)
		@feedback = feedback
		# mail(to: "tinamugarra@sheevys.com", subject: "Sheevys Feedback")
		mail(to: "brucemakallan@gmail.com", subject: "Sheevys Feedback")
	end
end
