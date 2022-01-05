module TriviumsHelper

  def set_status(status)
    case status
    when 'inactived'
      false
    when 'actived'
      true
    end
  end
end
