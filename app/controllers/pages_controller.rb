class PagesController < ApplicationController
  
  require 'mail' #mail gem

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
  	p "IMAGE ROWS = #{@image_rows}"
  	p "**" * 22
  end
end