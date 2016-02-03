class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :author, class_name: 'User'

  after_create :broadcast_create
  after_create :close

  def broadcast_create
    data = {
      action: 'newMessage',
      data: JSONAPI::ResourceSerializer.new(MessageResource).serialize_to_hash(MessageResource.new(self, nil))
    }
    ActionCable.server.broadcast "ConversationChannel:#{self.conversation.id}", data
  end

  def close
    conversation = self.conversation

    if conversation.messages.count >= conversation.length * 2
      conversation.update status: 'finished'
    end
  end
end