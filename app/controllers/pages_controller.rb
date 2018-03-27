class PagesController < ApplicationController
  
  #skip_before_action :verify_authenticity_token
  
  def home 
    @carousel_items = {
  		"image1" => {
  			"classes": "carousel-item active",
  			"image_url": "carousel/001.jpg",
  			"heading": "Sheevy's Bed and Breakfast",
  			"subheading": "Each member of our team strives to make our guests feel at home and we look forward to welcoming you to our piece of paradise in beautiful Tooro."
  		},
  		"image2" => {
  			"classes": "carousel-item",
  			"image_url": "carousel/002.jpg",
  			"heading": "Sheevy's Bed and Breakfast",
  			"subheading": "Each member of our team strives to make our guests feel at home and we look forward to welcoming you to our piece of paradise in beautiful Tooro."
  		}
	  }


    if params[:commit] == "Check Availability" #Check Availability button submitted
        puts "Check Availability button Clicked"
        # @email = Email.new(fullname: params['fullname'], phone: params['phone'], datein: params['checkin'], dateout: params['checkout'], roomtype: params['roomtype'], occupancy: params['occupancy'], adults: params['adults'], children: params['children'])
        # FormMailer.send_email(@email).deliver
        # redirect_to home_path, notice: 'Your Booking information was sent'

        #Validate dates
        checkin = Date.strptime(params['checkin'], '%Y-%m-%d').strftime("%Y%m%d").to_i
        checkout = Date.strptime(params['checkout'], '%Y-%m-%d').strftime("%Y%m%d").to_i
        today = Time.now.strftime("%Y%m%d").to_i
        p "Checkin: #{checkin}"
        p "Checkout: #{checkout}"
        p "Today / Now: #{today}"

        if checkin < today
          redirect_to home_path, notice: 'Check-in date cannot be set to the past'
        elsif checkout < (today + 1)
          redirect_to home_path, notice: 'Check-out date must be after Today'
        elsif checkout <= checkin
          redirect_to home_path, notice: 'Check-out date must be after Check-in date'
        end
    end

    if params[:commit] == "Send Feedback"
        puts "Send Feedback button Clicked"
        @feedback = FeedbackMail.new(fullname: params['fullname'], email: params['email'], timeofstay: params['timeofstay'], rating: params['rating'], notes: params['notes'])
        FormMailer.send_feedback(@feedback).deliver
        redirect_to home_path, notice: 'Your Feedback information was sent'
    end
  end

  def gallery
    @page_title = "Sheevy's | Gallery"

    #Get gallery images 
    @image_files = Dir.glob("#{Rails.root}/app/assets/images/gallery/*")
    @image_files.sort!
    p @image_files[0].split("/").pop
    @image_rows = (@image_files.size / 4).to_i
    if @image_files.size % 4 > 0
    	@image_rows += 1
    end
  end

  def rooms
  end

  def location
  end

end