class WorkOrdersController < ApplicationController
  before_action :find_work_order, only: [:show, :update, :destroy, :edit]


  def index
    @orders = WorkOrder.all
  end

  def new
    @order = WorkOrder.new
    @techs = Technician.all
    @clients = Client.all
  end

  def create
    @order = WorkOrder.new(order_params)
    if @order.valid?
      @order.save
      redirect_to @order
    else
      flash[:errors] = @order.errors.full_messages
      redirect_to new_work_order_path
    end
  end

  def show
  end

  def edit
    @techs = Technician.all
    @clients = Client.all
  end

  def update
    if @order.update(order_params)
      redirect_to work_orders_path
    else
      flash[:errors] = @order.errors.full_messages
      redirect_to edit_work_order_path(@order)
    end
  end

  def destroy
    @order.destroy
    redirect_to work_orders_path
  end

  private

  def find_work_order
    @order = WorkOrder.find(params[:id])
  end

  def order_params
    params.require(:work_order).permit(:jobname, :status, :technician_id, :client_id)
  end
end