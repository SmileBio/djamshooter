class Admin::RegionsController < BaseAdminController

  before_action :load_region, only: [:show, :update, :edit, :destroy]
  before_action :authenticate_user!
  before_action :authorize!

  def index
    @regions = Region.all
  end

  def show
  end

  def new
    @region = Region.new
  end

  def edit
  end

  def create
    @region = Region.create(region_params)
    redirect_to admin_region_path(@region), notice: "succuess"
  end

  def update
    @region.update_attributes(region_params)
    redirect_to admin_region_path(@region)
  end

  def destroy
    @region.destroy
    redirect_to action: "index"
  end

  private
    def load_region
      @region = Region.find_by(id: params[:id])
    end

    def region_params
      params.require(:region).permit(:title)
    end

    def authorize!
      redirect_to "/404" unless current_user.is?(:admin)
    end

end
