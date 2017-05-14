class Admin::CitiesController < BaseAdminController

  before_action :load_region, only: [:index, :new, :create]
  before_action :load_city, only: [:show, :edit, :destroy, :update]

  def index
    @cities = @region.cities
  end

  def show
  end

  def new
    @city = City.new
  end

  def edit
  end

  def create
    @city = @region.cities.new(city_params)
    if @city.save
      redirect_to admin_region_cities_path(@city.region_id)
    else
      render "new"
    end
  end

  def update
    if @city.update_attributes(city_params)
      redirect_to admin_region_cities_path(@city.region_id)
    else
      render "edit"
    end
  end

  def destroy
    @city.destroy
    redirect_to admin_region_cities_path(@city.region_id)
  end

  private
    def load_city
      @city = City.find_by(id: params[:id])
    end

    def load_region
      @region = Region.find_by(id: params[:region_id])
    end

    def city_params
      params.require(:city).permit(:title)
    end


end
