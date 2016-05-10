class CountriesController < ApplicationController
  respond_to :html

  expose(:country, attributes: :country_params)
  expose(:countries) { Country.page(params[:page]) }

  def create
    flash[:notice] = 'Country was successfully created.' if country.save
    respond_with(country)
  end

  def update
    flash[:notice] = 'Country was successfully updated.' if country.save
    respond_with(country)
  end

  def destroy
    country.destroy
    respond_with(country)
  end

  private

  def country_params
    params.require(:country).permit(:name, :visitors, :information, :history, :economic, {images: []}, :culture)
  end
end