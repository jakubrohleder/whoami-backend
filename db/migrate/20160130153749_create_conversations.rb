class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations, id: :uuid do |t|
      t.uuid :author, null: false
      t.uuid :whoami
      t.string :status, default: 'created', null: false

      t.datetime :author_seen_at
      t.datetime :whoami_seen_at
    end
  end
end
