class UsersController < ApplicationController
  load_and_authorize_resource find_by: :slug
  before_action :set_user, only: [:show, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user.skip_password_validation = true
    if @user.update!(available: !@user.available)
      if !@user.available
        redirect_to @user, notice: { message: 'User was successfully locked.' }
      else
        redirect_to @user, notice: { message: 'User was successfully unlocked.' }
      end
    else
      if !@user.available
        redirect_to @user, notice: { errors: 'User was unsuccessfully locked.' }
      else
        redirect_to @user, notice: { errors: 'User was unsuccessfully unlocked.' }
      end
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    if current_admin.nil?
      flash[:error] = "Access denied: #{exception}"
      redirect_to new_admin_session_path
    else
      render file: 'public/403.html', layout: false
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :password_digest, :email, :name, :gender, :address, :description, :auth_token, :confirm_send_at, :confirm_token, :confirm_at, :reset_send_at, :reset_token, :available, :slug, :city, :district, :ward)
  end
end
