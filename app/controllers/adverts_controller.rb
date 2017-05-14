class AdvertsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :load_advert, only: [:edit, :update, :destroy]

  def index
    @adverts = Advert.all.includes(:user)
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


  private
    def advert_params
      params.require(:advert).permit(:title, :description, :user_id)
    end

    def load_advert
      @advert = current_user.adverts.find_by(id: params[:id])#Advert.where(id: params[:id]).where(user_id: current_user.id).first
    end

end
