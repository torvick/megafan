class HomeController < ApplicationController
  
  def index
    @title = t('sidebar.home.title')
    @client_total = Client.all.count
    @cient_activated = Client.where(last_sign_in_at: DateTime.new - 15.days ..DateTime.new).count
    @client_og = Client.joins(:social_networks).where('social_networks.sc_key': 0).count
    @client_fb = Client.joins(:social_networks).where('social_networks.sc_key': 2).count
    @client_ig = Client.joins(:social_networks).where('social_networks.sc_key': 1).count
    @client_tk = Client.joins(:social_networks).where('social_networks.sc_key': 3).count
    @data = DataGraphic.graphic_1
  end

end
