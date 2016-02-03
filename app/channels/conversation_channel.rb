class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ConversationChannel:#{params[:id]}"
  end
end
