class PagesController < ApplicationController
  
  def home
  	@carousel_items = {
		"image1" => {
			"classes": "carousel-item active",
			"image_url": "carousel/1_0.jpg",
			"heading": "Sheevy's Bed and Breakfast",
			"subheading": "Indulge in the best"
		},
		"image2" => {
			"classes": "carousel-item",
			"image_url": "carousel/1_1.jpg",
			"heading": "Beautiful Exterior",
			"subheading": ""
		},
		"image3" => {
			"classes": "carousel-item",
			"image_url": "carousel/2.jpg",
			"heading": "Catch some Sun",
			"subheading": ""
		},
		"image4" => {
			"classes": "carousel-item",
			"image_url": "carousel/3.jpg",
			"heading": "Fancy interior just for you",
			"subheading": ""
		}
	}
  end

  def gallery
  	@page_title = "Sheevy's | Gallery"

  	#Get gallery images 
  	@image_files = Dir.glob("#{Rails.root}/app/assets/images/gallery/*")
  	p @image_files[0].split("/").pop
  	@image_rows = (@image_files.size / 4).to_i
  	if @image_files.size % 4 > 0
  		@image_rows += 1
  	end
  	p "IMAGE ROWS = #{@image_rows}"
  	p "**" * 22
  end
  
end