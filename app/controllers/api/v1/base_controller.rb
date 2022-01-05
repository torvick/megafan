class Api::V1::BaseController < ApplicationController
  
  before_action :logs
  skip_before_action :authenticate_user!
  protect_from_forgery prepend: true
  before_action :authorized, except: [:ping]
  before_action :set_response
  

  def ping
    response_method(true,'pong')
    response = ResponsesEngine.build!(params)
    render json: response, status: response[:code]
  end

  def encode_token(payload)
    JWT.encode(payload, 'G1mD3mo2@2!')
  end
  
  def auth_header
    request.headers['Authorization']
  end
  
  def decoded_token
    if auth_header
      begin
        decode = JWT.decode(auth_header, 'G1mD3mo2@2!', true, algorithm: 'HS256')
        return decode.first
      rescue JWT::DecodeError
        {}
      end
    end
  end

  def logged_in_user
    if !decoded_token.empty? && decoded_token['user_id'].present?
      user_id = decoded_token['user_id']
      @user = User.find_by(id: user_id)
    elsif !decoded_token.empty? && decoded_token['client_id'].present?
      client_id = decoded_token['client_id']
      @client = Client.select(:id,:name,:email,:avatar).find_by(id: client_id)
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    response_method(false,'Please log in') unless logged_in?
    response = ResponsesEngine.build!(params) unless logged_in?
    render json: response, status: response[:code] unless logged_in?
  end

  private

    def badRequest(validate)
      response_method(false,validate)
      response         = ResponsesEngine.build!(params)
      return response
    end

    def create_image(base64,name)
      response = Bucket.create_image({
        name: name,
        content_type: 'image/png',
        content_encoding: "base64",
        extension: '.png',
        file: base64
      })
      if response.dig('data','urlFile')
        response['data']['urlFile']
      else
        ""
      end
    end

    def response_method(status, data)
      params[:data] = {} if params[:data].nil?
      if status
        params[:data][:code]  = 200
        params[:data]['data'] = data
      else
        params[:data][:code]    = 400
        params[:data][:errors]  = [data]
        params[:data][:message] = data
      end
    end

    def logs
      params[:method]         = request.env['REQUEST_METHOD']
      params[:url_path]       = request.url
      params[:request_id]     = request.request_id
      params[:request_ip]     = request.remote_ip
      uri                     = URI(params[:url_path])
      params[:get_host]       = "#{uri.scheme}://#{uri.host}"
    end
    
    
    def set_response
      params[:data] = {}
    end

end
