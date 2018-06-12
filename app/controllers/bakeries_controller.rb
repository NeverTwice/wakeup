class BakeriesController < ApplicationController
  before_action :set_bakery, only: [:show, :edit, :update, :destroy]

  # GET /bakeries
  # GET /bakeries.json
  def index
    @bakeries = Bakery.all
  end

  # GET /bakeries/1
  # GET /bakeries/1.json
  def show
  end

  # GET /bakeries/new
  def new
    @bakery = Bakery.new
  end

  # GET /bakeries/1/edit
  def edit
  end

  # POST /bakeries
  # POST /bakeries.json
  def create
    @bakery = Bakery.new(bakery_params)

    respond_to do |format|
      if @bakery.save
        format.html { redirect_to @bakery, notice: 'Bakery was successfully created.' }
        format.json { render :show, status: :created, location: @bakery }
      else
        format.html { render :new }
        format.json { render json: @bakery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bakeries/1
  # PATCH/PUT /bakeries/1.json
  def update
    respond_to do |format|
      if @bakery.update(bakery_params)
        format.html { redirect_to @bakery, notice: 'Bakery was successfully updated.' }
        format.json { render :show, status: :ok, location: @bakery }
      else
        format.html { render :edit }
        format.json { render json: @bakery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bakeries/1
  # DELETE /bakeries/1.json
  def destroy
    @bakery.destroy
    respond_to do |format|
      format.html { redirect_to bakeries_url, notice: 'Bakery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bakery
      @bakery = Bakery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bakery_params
      params.require(:bakery).permit(:company_name, :picture, :created_at, :updated_at)
    end
end
