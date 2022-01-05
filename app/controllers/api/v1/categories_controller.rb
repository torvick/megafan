class Api::V1::CategoriesController < Api::V1::BaseController

  skip_before_action :authorized

  def index
    categories = Category.all.select(:id,:name,:description,:value)
    response_method(true, categories)
    response = ResponsesEngine.build!(params)
    render json: response, status: response[:code]
  end

  def show
    category = Category.select(:id,:name,:description,:value).find_by(id: params[:id])
    response_method(true, category)
    response = ResponsesEngine.build!(params)
    render json: response, status: response[:code]
  end

end
