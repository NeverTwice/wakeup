class WeeksController < ApplicationController
  include ApplicationHelper

  before_action :checkRights, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_week, only: [:show, :edit, :update, :destroy]

  def index
    @weeks = Week.all
  end

  def show
  end

  def new
    @week = Week.new
  end

  def edit
  end

  def create
    @week = Week.new(week_params)
    if @week.save
      redirect_to @week, notice: 'Week was successfully created.'
    else
      render :new
    end
  end

  def update
    if @week.update(week_params)
      redirect_to @week, notice: 'Week was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @week.destroy
    redirect_to weeks_url, notice: 'Week was successfully destroyed.'
  end

  private
    def set_week
      @week = Week.find(params[:id])
    end

    def week_params
      params.require(:week).permit(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
    end
end
