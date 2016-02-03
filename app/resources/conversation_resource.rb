class ConversationResource < JSONAPI::Resource
  attribute :status
  attribute :length
  attribute :respondent
  attribute :answer

  has_many :messages
  has_one :author, class_name: 'User'
  has_one :whoami, class_name: 'User'
end
