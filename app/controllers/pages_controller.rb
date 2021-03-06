class PagesController < ApplicationController
  
  #skip_before_action :verify_authenticity_token
  
  def home 
    $selected_dates_ar = Array.new #array of all selected dates: Booking objects
    
    @carousel_items = {
  		"image1" => {
  			"classes": "carousel-item active",
  			"image_url": "carousel/001.jpg",
  			"heading": "Sheevy's Bed and Breakfast",
  			"subheading": "A gem in the heart of Fortportal"
  		},
  		"image2" => {
  			"classes": "carousel-item",
  			"image_url": "carousel/002.jpg",
  			"heading": "Sheevy's Bed and Breakfast",
  			"subheading": "A gem in the heart of Fortportal"
  		}
	  }


    if params[:commit] == "Send Feedback"
        puts "Send Feedback button Clicked"
        @feedback = FeedbackMail.new(fullname: params['fullname'], email: params['email'], timeofstay: params['timeofstay'], rating: params['rating'], notes: params['notes'])
        FormMailer.send_feedback(@feedback).deliver
        redirect_to home_path, notice: 'Your Feedback information was sent'
    end


    begin #For exception handling      
      if params[:commit] == "Check Availability" #Check Availability button submitted
        puts "Check Availability button Clicked"
        
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
        elsif (Date.strptime(params['checkout'], '%Y-%m-%d') - Date.strptime(params['checkin'], '%Y-%m-%d')) > 100
          #must use Date object here for date comparison to avoid going past 31st
          redirect_to home_path, notice: 'Only a maximum of 100 days is allowed'
        else #Everything OK 
          #get all booked dates from database
          #loop through them while comparing with selected dates
          #if they match, show available rooms and booked rooms
          #if not, then all slots are available

          selected_date = Date.strptime(params['checkin'], '%Y-%m-%d') #init 
          i = 0
          while selected_date <= Date.strptime(params['checkout'], '%Y-%m-%d') #loop from checkin to checkout dates
            p "Selected date: #{selected_date}"
            $selected_dates_ar[i] = Booking.new(booking_date: selected_date.strftime("%Y%m%d").to_i, deluxe_room: false, double_room: false, single_room: false, twin_room: false)
            #compare with booked dates
            (Booking.all).each do |booked_entry|
              if selected_date.strftime("%Y%m%d").to_i == booked_entry[:booking_date].strftime("%Y%m%d").to_i
                p "*"*55
                p "Selected date: #{selected_date} is same as Booked date: #{booked_entry[:booking_date].strftime("%Y%m%d").to_i}"
                ($selected_dates_ar[i])[:deluxe_room] = booked_entry[:deluxe_room]
                ($selected_dates_ar[i])[:double_room] = booked_entry[:double_room]
                ($selected_dates_ar[i])[:single_room] = booked_entry[:single_room]
                ($selected_dates_ar[i])[:twin_room] = booked_entry[:twin_room]
              end
            end

            selected_date += 1 #do NOT add to the integer date but the Date object itself
            i += 1
          end

          redirect_to availability_path
        end
      end
    rescue StandardError => e
      redirect_to home_path, notice: 'Form Authentication warning: Please retry'
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


  def availability
    if params[:commit] == "Book Now"
        puts "Book Now button Clicked"
        p "*" * 55

        fullname = params['fullname']
        phone = params['phone']
        datein = Date.strptime($selected_dates_ar.first[:booking_date].to_s, '%Y%m%d')
        dateout = Date.strptime($selected_dates_ar.last[:booking_date].to_s, '%Y%m%d')
        occupancy = ""
        adults = params['adults']
        children = params['children']

        deluxe_rooms = params['deluxe_chx'].nil? ? 0 : 1
        double_rooms = params['double_chx'].nil? ? 0 : 1
        twin_rooms = params['twin_chx'].nil? ? 0 : 1
        single_rooms = params['single_chx'].nil? ? 0 : 1
        roomtypes = "Deluxe Room: #{deluxe_rooms},   Double Room: #{double_rooms},   Twin Room: #{twin_rooms},   Single Room: #{single_rooms}"
        
        #send email
        @email = Email.new(fullname: fullname, phone: phone, datein: datein, dateout: dateout, roomtype: roomtypes, occupancy: occupancy, adults: adults, children: children)
        FormMailer.send_email(@email).deliver
        
        #redirect
        redirect_to home_path, notice: 'Your Booking information was sent'
    end
  end


  def breakfast
    @page_title = "Sheevy's | Breakfast"
  end



  def specials
    @page_title = "Sheevy's | Specials"
  end


end