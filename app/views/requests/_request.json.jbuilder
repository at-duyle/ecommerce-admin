json.extract! request, :id, :name, :email, :phone_number, :shop_name, :shop_address, :latitude, :longitude, :created_at, :updated_at
json.url request_url(request, format: :json)
