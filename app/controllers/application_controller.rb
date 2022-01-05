class ApplicationController < ActionController::Base
  before_action :set_locale,:authenticate_user!, :get_path

  def set_locale
    I18n.locale = params[:locale] ||= :es
  end

  def get_path
    uri = URI(request.url)
    @path = uri.path
  end
  
end
