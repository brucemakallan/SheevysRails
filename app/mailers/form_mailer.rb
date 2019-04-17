class FormMailer < ApplicationMailer
	default from: 'sheevys.bnb@gmail.com'

	layout "mailer"

	def send_email(email)
		@email = email
		mail(to: "tinamugarra@sheevys.com", subject: "New Sheevys Booking")	
		mail(to: "caarinaitwe97@gmail.com", subject: "New Sheevys Booking")
		# sending to webmaster for record keeping and debugging		
		mail(to: "brucemakallan@gmail.com", subject: "New Sheevys Booking")			
	end

	def send_feedback(feedback)
		@feedback = feedback
		mail(to: "tinamugarra@sheevys.com", subject: "Sheevys Feedback")
		mail(to: "caarinaitwe97@gmail.com", subject: "Sheevys Feedback")
		# sending to webmaster for record keeping and debugging
		mail(to: "brucemakallan@gmail.com", subject: "Sheevys Feedback")
	end
end
