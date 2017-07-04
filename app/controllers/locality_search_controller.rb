class LocalitySearchController < ApplicationController

  def region
    data = params[:region]
    @regions = Region.where("regions.title LIKE ?", "%#{data}%")

    render json: @regions
  end

  def city
  end

  def city_region
    data = params[:city]
    @city = City.where("cities.title LIKE ?", "%#{data}%").eager_load(:region)

    render json: @city, include: :region
  end


end
