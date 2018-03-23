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


    if params[:commit] == "Book Now" #Book Now button submitted
        puts "Clicked"
        FormMailer.send_email.deliver
        redirect_to home_path, notice: 'Your Booking information was sent'
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
end