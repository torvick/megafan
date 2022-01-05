class GenerateClient

  attr_accessor :data

  def self.generate!(data)
    g = self.new
    g.data = data
    g.create
  end

  def create
    if client.nil?
      set_client
      set_balances
      set_social_network
      return {success: true,data: client}
    else
      return {success: false,data: 'Client register'}
    end
  end

  def client
    @client ||= Client.find_by('email = ? OR phone = ?', self.data[:email],self.data[:phone])
  end

  def set_balances
    TypeBalance.all.each do |type_balance|
      balance = client.balances.new
      balance.type_balance_id = type_balance.id
      balance.save
    end
  end

  def set_social_network
    social_network = client.social_networks.new
    social_network.name = self.data[:type_register].upcase
    social_network.sc_key = self.data[:type_register]
    social_network.sn_id = self.data[:sc_network]
    social_network.save
    social_network
  end

  def set_client
    client = Client.new
    client.name = self.data[:name]
    client.mdd_name = self.data[:mdd_name]
    client.lt_name = self.data[:lt_name]
    client.sc_lt_name = self.data[:sc_lt_name]
    client.display_name = display_name
    client.gender = self.data[:gender]
    client.dob = self.data[:dob]
    client.phone = self.data[:phone]
    client.email = self.data[:email]
    client.role = role
    client.country = country 
    client.ranking = ranking
    client.password = self.data[:password]
    client.save
    client
  end

  def display_name
    self.data[:name] + ' ' + self.data[:mdd_name] + ' ' + self.data[:lt_name] + ' ' + self.data[:sc_lt_name]
  end

  def country
    @country ||= Country.find(self.data[:country_id])
  end

  def role
    @role ||= Role.find_by_value(1)
  end

  def ranking
    @ranking ||= Ranking.find_by_value(1)
  end

end