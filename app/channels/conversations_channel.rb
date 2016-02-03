class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'ConversationsChannel'
  end

  def joined(data)
    conversation = Conversation.find(data['conversation'])
    whoami = User.find(data['user'])
    respondent = ['human', 'bot'].sample
    conversation.update(status: 'active', respondent: respondent, whoami: whoami)
  end
end
