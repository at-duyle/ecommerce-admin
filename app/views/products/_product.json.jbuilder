json.extract! product, :id, :name, :producer, :price, :quantity, :description, :categorical_type, :categorical_id, :shop_id, :slug, :available, :created_at, :updated_at
json.url product_url(product, format: :json)
