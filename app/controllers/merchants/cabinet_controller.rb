class Merchants::CabinetController < BaseMerchantCabinetController

  before_action :authenticate_user!
  before_action :load_merchant_page

  def main

  end

  def categories
    @merchant_categories =  Category.includes(:merchant_pages)
    render "cabinet_categories"
  end

  def cities
  end

  def galery

  end

  def price_list
  end

  def new
    @merchant_page = current_user.merchant_page
  end


  def create_main
    if @merchant_page.update_attributes(main_params)
      redirect_to "/cabinet_main"
    else
      flash[:notice] = @merchant_page.errors.messages.to_s
      render "main"
    end
  end

  def create_categories
    if @merchant_page.update_attributes(categories_params)
      redirect_to "/cabinet_categories"
    else
      render "cabinet_categories"
    end
  end

  def create_cities
    if @merchant_page.update_attributes(cities_params)
      redirect_to "/cabinet_cities"
    else
      render "cities"
    end
  end

  def create_galery
    if @merchant_page.update_attributes(galeries_params)
      redirect_to "/cabinet_galery"
    else
      render "galery"
    end
  end

  def create_price_list
    if @merchant_page.update_attributes(categories_params)
      redirect_to "/cabinet_price_list"
    else
      render "price_list"
    end
  end

  private
    def merchant_params
      params.require(:merchant_page).permit(:company_name, :description, :phone, :company_logo, :approved,
                                            merchant_services_attributes:[:service_id, :price, :id, :_destroy],
                                            galeries_attributes: [:id, :title, :_destroy, images_attributes:[:id, :image, :_destroy]]
                                            )
    end

    def main_params
      params.require(:merchant_page).permit(:company_name, :description, :phone, :company_logo, :approved)
    end

    def categories_params
      params[:merchant_page] = {category_ids:[]} unless params[:merchant_page]
      params.require(:merchant_page).permit(category_ids:[])
    end

    def load_merchant_page
      @merchant_page = current_user.merchant_page
    end

    def galeries_params
      params.require(:merchant_page).permit(galeries_attributes: [:id, :title, :_destroy, images_attributes:[:id, :image, :image_file_name, :_destroy]])
    end

end
