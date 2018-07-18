class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.all
  end

  def show
  end

  def new
    @address = Address.new
  end

  def edit
  end




  def create
    @address = Address.new(address_params)
    if @address.save
      if current_user.baker?
        redirect_to new_bakery_path, notice: 'Address was successfully created.'
      else
        redirect_to bakeries_path, notice: 'Address was successfully created.'
      end
    else
      render :new
    end
  end

  def update
    if @address.update(address_params)
      redirect_to @address, notice: 'Address was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to addresses_url, notice: 'Address was successfully destroyed.'
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:street, :zipcode, :country, :user_id)
    end
end
