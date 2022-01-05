class LanguagesController < ApplicationController

  before_action :set_language, only: [:show,:edit,:update]

  def index
    @title = t('sidebar.languages.list')
    @languages = Language.all
  end

  def show
    @title = t('sidebar.languages.show')
  end

  def new
    @title = t('sidebar.languages.new')
    @language = Language.new
  end

  def update
    if @language.update(language_params)
      flash[:notice] = t('languages.update.success')
      render 'show'
    else
      flash[:warning] = t('languages.update.error')
      render 'edit'
    end
  end

  def create
    @language = Language.create(language_params)
    if @language.valid?
      flash[:notice] = t('languages.create.success')
      render 'show'
    else
      flash[:warning] = t('languages.create.error')
      render 'new'
    end
  end

  def edit
    @title = t('sidebar.languages.edit')
  end

  private

    def set_language
      @language = Language.find_by(id: params[:id])
      unless @language
        flash[:warning] = t('languages.not_found') 
        render 'index'     
      end
    end

    def language_params
      params.require(:languages).permit(:name,:description,:value)
    end
end
