class Conversation < ApplicationRecord
  has_many :messages
  belongs_to :author, class_name: 'User'
  belongs_to :whoami, class_name: 'User'
end
