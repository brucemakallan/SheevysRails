json.extract! booking, :id, :booking_date, :deluxe_room, :double_room, :single_room, :twin_room, :created_at, :updated_at
json.url booking_url(booking, format: :json)
