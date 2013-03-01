class CustomersController < ApplicationController
  def index
    @customers = Customer.all

    respond_to do |format|
      format.html
      format.json { render :json => @customers }
    end
  end
end
