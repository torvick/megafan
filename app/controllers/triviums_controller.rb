class TriviumsController < ApplicationController

  before_action :set_trivium, only: [:show,:edit,:update]

  def index
    @title = t('sidebar.triviums.list')
    @triviums = Trivium.all
  end

  def new
    @title = t('sidebar.triviums.new')
    @trivium = Trivium.new
  end

  def show
    @title = t('sidebar.triviums.show')
  end
 
  def edit
    @title = t('sidebar.triviums.edit')
  end

  def add_question
    @question = Question.new
  end

  def add_answer
    @answer_index = params[:question_index]
    @type = params[:type]
    @answer = Answer.new
  end

  def update
    params[:triviums][:user_id] = current_user.id
    response = EditTrivium.generate!(params)
    if response[:success]
      flash[:notice] = t('notices.triviums.update.correct')
      redirect_to triviums_path()
    else
      flash[:warning] = t('notices.triviums.update.incorrect')
      redirect_to new_trivium_path()
    end
  end

  def create
    params[:triviums][:user_id] = current_user.id
    response = GenerateTrivium.generate!(params)
    if response[:success]
      flash[:notice] = t('notices.triviums.create.correct')
      redirect_to triviums_path()
    else
      flash[:warning] = t('notices.triviums.create.incorrect')
      redirect_to new_trivium_path()
    end
  end

  private

    def set_trivium
      @trivium = Trivium.find_by(id: params[:id])
      unless @trivium
        flash[:warning] = t('triviums.not_found') 
        render 'index'
      end
    end

end
