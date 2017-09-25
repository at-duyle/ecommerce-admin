class AdminsController < ApplicationController
  load_and_authorize_resource
  before_action :set_admin, only: [:show, :update, :destroy]

  # GET /admins
  # GET /admins.json
  def index
    @admins = current_admin.admin? ? Admin.all : Admin.where(manager_id: current_admin.id)
    @admins = @admins.drop(1) if current_admin.admin?
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params.merge(password: 123456, role: 2, manager_id: current_admin.id,
                                          shop_id: current_shop.id))

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: { message: 'Admin was successfully created.' } }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    if @admin.update!(available: !@admin.available)
      if !@admin.available
        redirect_to @admin, notice: { message: 'Account was successfully locked.' }
      else
        redirect_to @admin, notice: { message: 'Account was successfully unlocked.' }
      end
    else
      if !@admin.available
        redirect_to @admin, notice: { errors: 'Account was unsuccessfully locked.' }
      else
        redirect_to @admin, notice: { errors: 'Account was unsuccessfully unlocked.' }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  # def destroy
  #   @admin.destroy
  #   respond_to do |format|
  #     format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

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
  def set_admin
    @admin = Admin.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_params
    params.require(:admin).permit(:username, :email, :name, :gender)
  end
end
