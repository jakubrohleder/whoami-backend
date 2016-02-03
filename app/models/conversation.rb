class Conversation < ApplicationRecord
  has_many :messages, -> { order 'created_at asc' }
  belongs_to :author, class_name: 'User'
  belongs_to :whoami, class_name: 'User', optional: true

  after_create :broadcast_create
  after_update :broadcast_update

  def broadcast_create
    data = {
      action: 'created',
      data: JSONAPI::ResourceSerializer.new(ConversationResource).serialize_to_hash(ConversationResource.new(self, nil))
    }
    ActionCable.server.broadcast 'ConversationsChannel', data
  end

  def broadcast_update
    data = {
      action: 'updated',
      data: JSONAPI::ResourceSerializer.new(ConversationResource).serialize_to_hash(ConversationResource.new(self, nil))
    }
    ActionCable.server.broadcast "ConversationChannel:#{self.id}", data
  end
end
