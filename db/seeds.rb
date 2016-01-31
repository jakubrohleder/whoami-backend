author = User.create name: 'author'
whoami = User.create name: 'whoami'

conversation = Conversation.create author: author, whoami: whoami, status: 'accepted'

5.times do |i|
  Message.create conversation: conversation, author: [author, whoami].sample, text: Faker::Lorem.sentence(3, true, 4)
end
