class Merchants::CabinetController < ApplicationController

  before_action :authenticate_user!, only: [:create, :new]

  def show
    @merchant_page = current_user.merchant_page
    @page_services = @merchant_page.merchant_services.includes(:service)
    render json: @merchant_page
  end

  def new
    @merchant_page = MerchantPage.new
    @categories = Category.roots.includes(sub_categories: [sub_categories: [:sub_categories]]).includes(:services)
    @categories.each{|c| puts c.root_category?}
    #@services = Service.where(category_id: params[:category]) if params[:category]
  end

  def edit
    @services = Service.where("category_id is not NULL")
    @merchant_page = current_user.merchant_page
  end

  def create
    #return render json: current_user
    @merchant_page = MerchantPage.new(merchant_params)
    @merchant_page.user_id = current_user.id
    if @merchant_page.save
      render json: @merchant_page
    else
      puts "there"
      render json: @merchant_page.errors
    end
  end

  def update
    @merchant_page = current_user.merchant_page
    #return render json: params
    if @merchant_page.update_attributes(merchant_params)
      redirect_to "/cabinet"
    else
      render "edit"
    end
  end

  def destroy
  end

  private
    def merchant_params
      params.require(:merchant_page).permit(:company_name, :description, :phone, merchant_services_attributes:[:service_id, :price, :id, :_destroy])
    end

end
