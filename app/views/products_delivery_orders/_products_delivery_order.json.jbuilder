json.extract! products_delivery_order, :id, :product_id, :delivery_order_id, :quantity, :created_at, :updated_at
json.url products_delivery_order_url(products_delivery_order, format: :json)
