json.extract! delivery_order, :id, :user_id, :status, :total_price, :name, :city, :district, :ward, :address, :phone, :created_at, :updated_at
json.url delivery_order_url(delivery_order, format: :json)
