class WelcomeController < ApplicationController

  def index
    @regions = Region.all
    @services = Service.where("title ILIKE ?", "%#{params[:search]}%") if params[:search]
    @merchants = MerchantPage.all.eager_load(merchant_services: [:service]) if params[:search]
    @merchants = @merchants.where("service_id in (?)", @services.map{|e| e.id}) if params[:search]

  end

end
