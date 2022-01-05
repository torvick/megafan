class CategoriesController < ApplicationController
 
  before_action :set_category, only: [:show,:edit,:update]

  def index
    @title = t('sidebar.categories.list')
    @categories = Category.all
  end

  def show
    @title = t('sidebar.categories.show')
  end

  def new
    @title = t('sidebar.categories.new')
    @category = Category.new
  end

  def update
    if @category.update(category_params)
      flash[:notice] = t('categories.update.success')
      render 'show'
    else
      flash[:warning] = t('categories.update.error')
      render 'edit'
    end
  end

  def create
    @category = Category.create(category_params)
    if @category.valid?
      flash[:notice] = t('categories.create.success')
      render 'show'
    else
      flash[:warning] = t('categories.create.error')
      render 'new'
    end
  end

  def edit
    @title = t('sidebar.categories.edit')
  end

  private

    def set_category
      @category = Category.find_by(id: params[:id])
      unless @category
        flash[:warning] = t('categories.not_found') 
        render 'index'     
      end
    end

    def category_params
      params.require(:categories).permit(:name,:description,:value)
    end
end
