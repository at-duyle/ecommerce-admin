class ProductsController < ApplicationController
  load_and_authorize_resource find_by: :slug
  skip_load_resource only: :sub
  skip_authorize_resource only: :sub

  before_action :set_product, only: %i[show edit update destroy]
  before_action :set_categories, only: %i[new edit create update]
  # GET /products
  # GET /products.json
  def index
    @products = Product.where(shop_id: current_shop.id)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @images = Image.where(product_id: @product.id)
  end

  # GET /products/new
  def new
    @availables = []
    @product = Product.new
    @images = @product.images.build
    @sub_categories = []
  end

  # GET /products/1/edit
  def edit
    @availables = [true, false]
    @image = Image.where(product_id: @product.id)
    @available = @product.available
    if @product.categorical_type.equal? 'Category'
      @category_value = @product.categorical_id
    else
      @sub_category_value = @product.categorical_id
      @category_value = SubCategory.find(@sub_category_value).category_id
      @sub_categories = SubCategory.where(category_id: @category_value)
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = if params[:product][:sub_category].nil?
                 Product.new(product_params.merge(shop_id: current_admin.shop_id,
                                                  categorical_type: 'Category',
                                                  categorical_id: params[:product][:category],
                                                  available: true))
               else
                 Product.new(product_params.merge(shop_id: current_admin.shop_id,
                                                  categorical_type: 'SubCategory',
                                                  categorical_id: params[:product][:sub_category],
                                                  available: true))
               end
    respond_to do |format|
      if @product.save!
        unless params[:images].nil?
          params[:images][:url].each do |image|
            @product.images.create!(url: image)
          end
        end
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        @availables = []
        @product = Product.new
        @images = @product.images.build
        @sub_categories = []
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if params[:product][:sub_category].nil?
        if @product.update(product_params.merge(shop_id: current_admin.shop_id,
                                                categorical_type: 'Category',
                                                categorical_id: params[:product][:category],
                                                available: params[:product][:available]))
          unless params[:images].nil?
            params[:images][:url].each do |image|
              @product.images.create!(url: image)
            end
          end
          format.html { redirect_to @product, notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: @product }
        else
          @availables = [true, false]
          @image = Image.where(product_id: @product.id)
          @available = @product.available
          if @product.categorical_type.equal? 'Category'
            @category_value = @product.categorical_id
          else
            @sub_category_value = @product.categorical_id
            @category_value = SubCategory.find(@sub_category_value).category_id
            @sub_categories = SubCategory.where(category_id: @category_value)
          end
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      else
        if @product.update!(product_params.merge(shop_id: current_admin.shop_id,
                                                 categorical_type: 'SubCategory',
                                                 categorical_id: params[:product][:sub_category],
                                                 available: params[:product][:available]))
          unless params[:images].nil?
            params[:images][:url].each do |image|
              @product.images.create!(url: image)
            end
          end
          format.html { redirect_to @product, notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: @product }
        else
          @availables = [true, false]
          @image = Image.where(product_id: @product.id)
          @available = @product.available
          if @product.categorical_type.equal? 'Category'
            @category_value = @product.categorical_id
          else
            @sub_category_value = @product.categorical_id
            @category_value = SubCategory.find(@sub_category_value).category_id
            @sub_categories = SubCategory.where(category_id: @category_value)
          end
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sub
    @sub_categories = SubCategory.where(category_id: params[:id])
    respond_to do |format|
      format.js
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
  def set_product
    @product = Product.friendly.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :producer, :price, :quantity, :description,
                                    images: [:id, :product_id, :url])
  end
end
