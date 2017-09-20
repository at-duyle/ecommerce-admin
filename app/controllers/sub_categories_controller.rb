class SubCategoriesController < ApplicationController
  load_and_authorize_resource find_by: :slug
  before_action :set_sub_category, only: [:show, :edit, :update, :destroy]

  # GET /sub_categories
  # GET /sub_categories.json
  def index
    @sub_categories = SubCategory.all
  end

  # GET /sub_categories/1
  # GET /sub_categories/1.json
  def show
  end

  # GET /sub_categories/new
  def new
    @category = Category.new
    @sub_category = SubCategory.new
    @categories = Category.all
  end

  # GET /sub_categories/1/edit
  def edit
    @categories = Category.all
  end

  # POST /sub_categories
  # POST /sub_categories.json
  def create
    @sub_category = SubCategory.new(sub_category_params)

    respond_to do |format|
      if @sub_category.save
        format.html { redirect_to @sub_category, notice: 'Sub category was successfully created.' }
        format.json { render :show, status: :created, location: @sub_category }
      else
        format.html { render :new }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_categories/1
  # PATCH/PUT /sub_categories/1.json
  def update
    respond_to do |format|
      if @sub_category.update(sub_category_params)
        format.html { redirect_to @sub_category, notice: 'Sub category was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_category }
      else
        format.html { render :edit }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_categories/1
  # DELETE /sub_categories/1.json
  def destroy
    @sub_category.destroy
    respond_to do |format|
      format.html { redirect_to sub_categories_url, notice: 'Sub category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied: #{exception}"
    redirect_to new_admin_session_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sub_category
    @sub_category = SubCategory.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sub_category_params
    params.require(:sub_category).permit(:name, :category_id)
  end
end
