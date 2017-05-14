class Merchants::CabinetController < ApplicationController

  before_action :authenticate_user!

  def show
    @merchant_page = current_user.merchant_page
    @page_services = @merchant_page.merchant_services.includes(:service)
    render text: "hi"
  end

  def new
    @merchant_page = MerchantPage.new
    @categories = Category.roots.includes(sub_categories: [sub_categories: [:sub_categories]]).includes(:services)
    @categories.each{|c| puts c.root_category?}
    #@services = Service.where(category_id: params[:category]) if params[:category]
  end

  def edit
  end

  def create
    render json: params
  end

  def update
  end

  def destroy
  end

end
