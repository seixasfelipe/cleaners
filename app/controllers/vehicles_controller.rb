class VehiclesController < ApplicationController

  def index
    @vehicles = Vehicle.all

    respond_with @vehicles
  end

  def new
    @vehicle = Vehicle.new

    respond_with @vehicle
  end

  def create
    @vehicle = Vehicle.new(params[:vehicle])
    @vehicle.save

    respond_with @vehicle
  end

  def edit
    @vehicle = Vehicle.find(params[:id])

    respond_with @vehicle
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    @vehicle.update_attributes(params[:vehicle])
   
    respond_with @vehicle
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
   
    respond_with @vehicle
  end
end
