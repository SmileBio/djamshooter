class MerchantsPagesController < ApplicationController


  def index
    @merchants_pages = MerchantPage.where(approved:true).order(id: "ASC").includes(:categories)
  end

  def show
    @merchant_page = MerchantPage.find_by(id: params[:id])
    @services = MerchantService.where(page_id: @merchant_page.id).includes(:service)
  end

end
