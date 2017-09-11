json.extract! admin, :id, :username, :password_digest, :email, :name, :gender, :role, :auth_token, :confirm_send_at, :confirm_token, :confirm_at, :reset_send_at, :reset_token, :manager_id, :available, :created_at, :updated_at
json.url admin_url(admin, format: :json)
