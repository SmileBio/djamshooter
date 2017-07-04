class AdvertsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :load_advert, only: [:edit, :update, :destroy]

  def index
    adverts = Advert.where(region_id: params[:region]).where(city_id: params[:city]) if !(params[:city].nil?) && params[:region]
    adverts = Advert.where(region_id: params[:region]) if params[:region] && params[:city].empty?
    adverts = Advert.where("region_id is NOT null").where("city_id is NOT null") if (params[:region] == nil || params[:region] == "") && (params[:city] == nil || params[:city] == "")
    adverts_to_show = adverts.includes(:user).includes(:region).includes(:city).page(params[:page] || 1).per(params[:per_page] || 8) if adverts

    if adverts

      @adverts_count = adverts.count
      @adverts = adverts_to_show.order(created_at: "DESC")
    else
      @adverts_count = 0
      @adverts = []
    end

  end

  def new
    @advert = Advert.new
  end

  def show
    @advert = Advert.find_by(id: params[:id])
  end

  def edit
  end

  def create
    @advert = current_user.adverts.new(advert_params)
    if @advert.save
      redirect_to advert_path(@advert)
    else
      render "new"
    end
  end

  def update
    if @advert.update_attributes(advert_params)
      redirect_to advert_path(@advert)
    else
      render "edit"
    end
  end

  def destroy
    if @advert.destroy
      redirect_to adverts_path
    else
      redirect_to :back
    end
  end

  def search_city
    data = params[:city]
    @city = City.where("cities.title LIKE ?", "%#{data}%").eager_load(:region)

    render json: @city, include: :region
  end


  private
    def advert_params
      params.require(:advert).permit(:title, :description, :user_id, :price, :region_id, :city_id)
    end

    def load_advert
      @advert = current_user.adverts.find_by(id: params[:id])#.includes(:region).includes(:city)
      @advert_location = @advert.region.title + "," + @advert.city.title
      @region_id = @advert.region_id
      @city_id = @advert.city_id
    end

end
