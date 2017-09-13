class Admins::SessionsController < Devise::SessionsController
  layout :false
  # before_action :configure_sign_in_params, only: [:create]

  before_action :authenticate_admin!

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      users_path
    elsif resource_or_scope == :manager
      products_path
    else
      root_path
    end
  end

  def after_sign_in_path_for(admin)
    if admin.admin?
      users_path
    else
      products_path
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end