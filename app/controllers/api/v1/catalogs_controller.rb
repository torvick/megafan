class Api::V1::CatalogsController < Api::V1::BaseController
  
  skip_before_action :authorized

  def countries
    countries = Country.all
    response_method(true, countries)
    response = ResponsesEngine.build!(params)
    render json: response, status: response[:code]
  end

  def languages
    languages = Language.all
    response_method(true, languages)
    response = ResponsesEngine.build!(params)
    render json: response, status: response[:code]
  end



end
