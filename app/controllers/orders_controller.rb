class OrdersController < ApplicationController
  def index
    @orders = Order.all

    respond_with @orders
  end

  def new
    @order = Order.new
    @vehicles = Vehicle.all(:order => :license_plate).map { |v| [v.license_plate, v.id] }

    respond_with @order
  end

  def create
    logger.debug "Params hash: #{params}"
    @order = Order.new(params[:order])

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
