class Api::V1::SessionsController < Api::V1::BaseController
  
  skip_before_action :authorized
  
  def login
    @client = Client.find_by(email: params[:email])
    if @client && @client.authenticate(params[:password])
      token = encode_token({client_id: @client.id})
      @client.update_columns(last_sign_in_at: Time.now,sign_in_count: (@client.sign_in_count.to_i + 1))
      response_method(true, {token: token})
    else
      response_method(false, "Invalid username or password")
    end
    response = ResponsesEngine.build!(params)
    render json: response, status: response[:code]
  end

  def valid_token
    response_method(true, @client)
    response = ResponsesEngine.build!(params)
    render json: response, status: response[:code]
  end

  def registers
    validate = ValidateSchemas.register(request.request_parameters)
    return render json: badRequest(validate) if !validate.empty?
    response = GenerateClient.generate!(params)
    response_method(response[:success],response[:data] )
    response = ResponsesEngine.build!(params)
    render json: response, status: response[:code]
  end

end
  