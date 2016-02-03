class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room]}"
  end

  def newMessage(data)
    user = User.find_or_create_by id: params[:user]
    conversation = Conversation.first
    message = Message.create text: data['message'], author: user, conversation: conversation
    message_json = JSONAPI::ResourceSerializer.new(MessageResource).serialize_to_hash(MessageResource.new(message, nil))
    message_json['action'] = data['action']
    ActionCable.server.broadcast "chat_#{params[:room]}", message_json
  end
end
