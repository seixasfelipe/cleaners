class OrdersController < ApplicationController
  def index
    @orders = Order.all

    respond_with @orders
  end

  def new
    @order = Order.new

    respond_with @order
  end

  def create
    @order = Order.new(params[:order])

    if(params[:vehicle_id])
      @order.vehicle_id = Vehicle.find(params[:vehicle_id])
    end

    @order.save

    respond_with @order
  end

  def edit
    @order = Order.find(params[:id])

    respond_with @order
  end

  def update
    @order = Order.find(params[:id])
    @order.update_attributes(params[:order])
   
    respond_with @order
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
   
    respond_with @order
  end
end
