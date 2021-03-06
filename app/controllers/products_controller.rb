class ProductsController < ApplicationController
  include ApplicationHelper

  before_action :checkRights, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
    @bakeries = Bakery.all
    @categories = Category.all
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to bakery_path(@mybakery.id), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to bakery_path(@mybakery.id), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to bakery_path(@mybakery.id), notice: 'Product was successfully destroyed.'
  end

  private
    def set_product
      @product = Product.find(params[:id])
      @bakeries = Bakery.all
      @categories = Category.all
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :quantity, :picture, :bakery_id, :category_id)
    end
end
