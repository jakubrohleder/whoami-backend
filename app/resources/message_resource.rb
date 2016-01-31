class MessageResource < JSONAPI::Resource
  attribute :text

  has_one :conversation
  has_one :author, class_name: 'User'
end
