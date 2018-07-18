class BakeriesController < ApplicationController
  before_action :set_bakery, only: %i[show edit update destroy]

  def index

    if params[:search].nil?
      @bakeries = Bakery.all
    else
      @bakeries = Bakery.where('company_name LIKE ?', "%#{params[:search]}%")
    end



  end

  def show
    @products = Product.where(:bakery_id => params[:id])
  end

  def new
    @bakery = Bakery.new
  end

  def edit
  end

  def create
    @bakery = Bakery.new(bakery_params)
    @bakery.user_id = current_user.id
    if @bakery.save
      redirect_to @bakery, notice: 'Your bakery was successfully created.'
    else
      render :new
    end
  end

  def update
    if @bakery.update(bakery_params)
      redirect_to @bakery, notice: 'Bakery was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @bakery.destroy
    redirect_to bakeries_url, notice: 'Bakery was successfully deleted.'
  end

  private

  def set_bakery
    @bakery = Bakery.find(params[:id])
  end

  def bakery_params
    params.require(:bakery).permit(:company_name, :picture, :created_at, :updated_at)
  end
end
