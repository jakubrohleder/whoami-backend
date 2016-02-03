class UserResource < JSONAPI::Resource
  attribute :name

  has_many :conversations
  has_many :messages
end
