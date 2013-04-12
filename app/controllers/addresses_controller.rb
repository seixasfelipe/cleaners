class AddressesController < ApplicationController
  def index
    @addresses = Address.all
    respond_with(@addresses)
  end

  def show
    @address = Address.find(params[:id])
    respond_with(@address)
  end

  def new
    @address = Address.new
    respond_with(@address)
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(params[:address])
    @address.save
    respond_with(@address)
  end

  def update
    @address = Address.find(params[:id])
    @address.update_attributes(params[:address])
    respond_with(@address)
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    respond_with(@address)
  end
end
