class ConversationResource < JSONAPI::Resource

  has_many :messages
  has_one :author, class_name: 'User'
  has_one :whoami, class_name: 'User'
end
