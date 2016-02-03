class User < ApplicationRecord
  has_many :author_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :whoami_conversations, class_name: 'Conversation', foreign_key: 'whoami_id'

  has_many :messages, foreign_key: 'author_id'

  def conversations
    author_conversations.or whoami_conversations
  end

  def conversation_ids=(ids) end
end
