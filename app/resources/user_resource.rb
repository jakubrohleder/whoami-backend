class UserResource < JSONAPI::Resource
  immutable

  attribute :name
end
