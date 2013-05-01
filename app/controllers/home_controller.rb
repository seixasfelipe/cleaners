class HomeController < ApplicationController
  def index
    @orders = Order.where closed: false

    respond_with @orders
  end
end
