class FormMailerController < ApplicationController

	def sendmail
	  	fullname = params['fullname']
	  	phone = params['phone']
	  	checkin = params['checkin']
	  	checkout = params['checkout']
	  	roomtype = params['roomtype']
	  	occupancy = params['occupancy']
	  	adults = params['adults']
	  	children = params['children']

	  	Mail.deliver do
	  		from    'brucemakallan@gmail.com'
	  		to      'makallancg2@gmail.'
	  		subject 'Here is the image you wanted'
	  		body    "Fullname: #{fullname}, Phone: #{phone}"
	  	end
  	end
end
