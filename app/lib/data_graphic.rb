class DataGraphic

  def self.graphic_1
    g = self.new
    g.generate
  end

  def generate
    data = {
      labels: labels,
      datasets: [
        users_total,
        users_facebook,
        users_instagram,
        users_tiktok,
        users_organics
      ]
    }.to_json
    return data
  end

  def labels
    @labels ||= [*0..23]
  end

  def users_total
    {
      label: I18n.translate('graphics.users_total'),
      data: body_array,
      borderColor: 'orange',
      backgroundColor: 'orange'
    }
  end

  def users_facebook
    {
      label: I18n.translate('graphics.users_facebook'),
      data: body_array,
      borderColor: 'blue',
      backgroundColor: 'blue'
    }
  end

  def users_instagram
    {
      label: I18n.translate('graphics.users_instagram'),
      data: body_array,
      borderColor: 'pink',
      backgroundColor: 'pink'
    }
  end

  def users_tiktok
    {
      label: I18n.translate('graphics.users_tiktok'),
      data: body_array,
      borderColor: 'brown',
      backgroundColor: 'brown'
    }
  end

  def users_organics
    {
      label: I18n.translate('graphics.users_organics'),
      data: body_array,
      borderColor: 'green',
      backgroundColor: 'green'
    }
  end

  def body_array
    labels.each do |hour|
      [
        q_total(hour),
        q_facebook(hour),
        q_instagram(hour),
        q_tiktok(hour),
        q_organics(hour)
      ]
    end
  end
  
  def date
    @date ||= Date.today - 1.day
  end
  
  def finish_date
    @finish_date ||= Time.new(date.strftime('%Y'), date.strftime('%m'), date.strftime('%d'), 23, 59, 59)
  end

  def initial_date
    @initial_date ||= Time.new(date.strftime('%Y'), date.strftime('%m'), date.strftime('%d'), 00, 00, 00)
  end

  def q_total(hour)
    Client.where(created_at: initial_date..finish_date).count
  end
  
  def q_facebook(hour)
    SocialNetwork.joins(:client).where(sc_key: 'facebook').where('clients.created_at': initial_date..finish_date).count
  end
  
  def q_instagram(hour)
    SocialNetwork.joins(:client).where(sc_key: 'instagram').where('clients.created_at': initial_date..finish_date).count
  end
  
  def q_tiktok(hour) 
    SocialNetwork.joins(:client).where(sc_key: 'tik_tok').where('clients.created_at': initial_date..finish_date).count
  end
  
  def q_organics(hour)
    SocialNetwork.joins(:client).where(sc_key: 'organics').where('clients.created_at': initial_date..finish_date).count
  end



end