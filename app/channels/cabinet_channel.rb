class CabinetChannel < ApplicationCable::Channel
  def subscribed
    stream_from "CabinetChannel"
    p "connected"
  end

  def unsubscribed

  end

  def report(data)
    ActionCable.server.broadcast 'CabinetChannel', message: data['rept']
  end
end
