class Admin::CategoriesController < BaseAdminController

  before_action :load_category, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!

  def index
    @categories = Category.roots.includes(sub_categories: [sub_categories: [:sub_categories]])
  end

  def show
  end

  def edit
    @categories = Category.eager_load(:sub_categories)
    authorize! :manage, @categories
  end

  def new
    @categories = Category.eager_load(:sub_categories)
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render "new"
    end
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to admin_categories_path
    else
      render "edit"
    end
  end

  def destroy
    if @category.destroy
      redirect_to admin_categories_path
    end
  end

  private

    def load_category
      @category = Category.find_by(id: params[:id])
    end

    def category_params
      params.require(:category).permit(:title, :parent_id, :icon)
    end
end
