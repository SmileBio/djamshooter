class Merchants::ServicesController < ApplicationController

  before_action :load_merchant_page, only: [:new, :index, :edit]

  def index
    @services = Service.all
    @categories = Category.all#.roots.includes(sub_categories: [sub_categories: [:sub_categories]])
    @services = @services.where(category_id: params[:category]) if params[:category]
  end

  def show
    @service = Service.find_by(id: params[:id])
  end

  def new
    @service = Service.find_by(id: params[:id])
    @page_service = @merchant_page.merchant_services.new
  end

  def create
    service_p = {}
    service_p[:price] = params[:merchant_service][:price]
    service_p[:service_id] = params[:id]
    @page_service = @merchant_page.merchant_services.new(service_p)
    if @page_service.save
      redirect_to services_path
    else
      render "new"
    end
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private
    def service_params
      params.require(:merchant_service).permit(:service_id, :page_id, :price)
    end

    def load_merchant_page
      @merchant_page = MerchantPage.find_by(user_id: current_user.id)
    end

end
