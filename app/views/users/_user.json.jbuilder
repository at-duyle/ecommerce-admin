json.extract! user, :id, :username, :password_digest, :email, :name, :gender, :address, :description, :auth_token, :confirm_send_at, :confirm_token, :confirm_at, :reset_send_at, :reset_token, :available, :slug, :city, :district, :ward, :created_at, :updated_at
json.url user_url(user, format: :json)
