class CountriesController < ApplicationController
  def index
    @countries = Country.all
    respond_with(@countries)
  end

  def show
    @country = Country.find(params[:id])
    respond_with(@country)
  end

  def new
    @country = Country.new
    respond_with(@country)
  end

  def edit
    @country = Country.find(params[:id])
  end

  def create
    @country = Country.new(params[:country])
    @country.save
    respond_with(@country)
  end

  def update
    @country = Country.find(params[:id])
    @country.update_attributes(params[:country])
    respond_with(@country)
  end

  def destroy
    @country = Country.find(params[:id])
    @country.destroy
    respond_with(@country)
  end
end
