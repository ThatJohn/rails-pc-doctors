class TechniciansController < ApplicationController

  before_action :find_technician, only: [:show, :destroy, :edit, :update]

  def index
    @technicians = Technician.all
  end

  def show
    @orders = @technician.work_orders
  end

  def new
    @tech = Technician.new
  end

  def create
    @tech = Technician.create(tech_params)
    redirect_to "/technicians"
  end

  def destroy
    @technician.destroy
    redirect_to technicians_path
  end

  def edit
  end

  def update
    @technician.update(tech_params)
    redirect_to technicians_path
  end


  private

  def find_technician
    @technician = Technician.find(params[:id])
  end

  def tech_params
    params.require(:technician).permit(:name)
  end


end
