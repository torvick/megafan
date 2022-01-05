class Api::V1::UsersController < Api::V1::BaseController

  def index
    users = Client.all.select(:id,:name,:email,:avatar)
    response_method(true, users)
    response = ResponsesEngine.build!(params)
    render json: response, status: response[:code]
  end

  def show
    @client = Client.find_by(id: params[:id])
    response_method(true, @client)
    response = ResponsesEngine.build!(params)
    render json: response, status: response[:code]
  end

  def get_user
    response_method(true, @client)
    response = ResponsesEngine.build!(params)
    render json: response, status: response[:code]
  end

end
