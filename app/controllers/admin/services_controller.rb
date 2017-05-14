class Admin::ServicesController < BaseAdminController

  before_action :load_category, only: [:index, :new, :create]
  before_action :load_service, except: [:index, :new, :create]

  def index
    @services = @category.services
  end

  def new
    @service = @category.services.new
  end

  def edit
  end

  def create
    @service = @category.services.new(service_params)
    if @service.save
      redirect_to admin_category_services_path(@category)
    else
      render "new"
    end
  end

  def update
    if @service.update_attributes(service_params)
      redirect_to admin_service_path(@service)
    else
      render "edit"
    end
  end

  def destroy
    if @service.destroy
      redirect_to admin_category_services_path(@service.category_id)
    end
  end

  private
    def load_category
      @category = Category.find_by(id: params[:category_id])
    end

    def load_service
      @service = Service.find_by(id: params[:id])
    end

    def service_params
      params.require(:service).permit(:title, :description, :category_id, :measure)
    end
end
