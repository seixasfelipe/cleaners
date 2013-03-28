class ItemsController < ApplicationController
  def index
  	@items = Item.all

  	respond_with @items
  end

  def new
  	@item = Item.new

  	respond_with @item
  end

  def create
  	@item = Item.new(params[:item])
    @item.save

    respond_with @item
  end

  def edit
    @item = Item.find(params[:id])

    respond_with @item
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(params[:item])

    respond_with @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_with @item
  end
end
