json.extract! products_purchase_order, :id, :product_id, :purchase_order_id, :quantity, :created_at, :updated_at
json.url products_purchase_order_url(products_purchase_order, format: :json)
