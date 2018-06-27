class PlanningsController < ApplicationController
  before_action :set_planning, only: [:show, :edit, :update, :destroy]

  def index
    @plannings = Planning.all
  end

  def show
  end

  def new
    @planning = Planning.new
  end

  def edit
  end

  def create
    @planning = Planning.new(planning_params)
    if @planning.save
      redirect_to @planning, notice: 'Planning was successfully created.'
    else
      render :new
    end
  end

  def update
    if @planning.update(planning_params)
      redirect_to @planning, notice: 'Planning was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @planning.destroy
    redirect_to plannings_url, notice: 'Planning was successfully destroyed.'
  end

  private
    def set_planning
      @planning = Planning.find(params[:id])
    end

    def planning_params
      params.require(:planning).permit(:open_hour, :close_hour, :bakery_id, :week_id)
    end
end
