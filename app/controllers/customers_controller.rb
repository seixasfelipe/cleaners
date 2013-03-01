class CustomersController < ApplicationController
  def index
    @customers = Customer.all

    respond_with @customers
  end

  def new
    @customer = Customer.new

    respond_with @customer
  end

  def create
    @customer = Customer.new(params[:customer])
    @customer.save

    respond_with @customer
  end
end
