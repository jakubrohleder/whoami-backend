class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations, id: :uuid do |t|
      t.uuid :author_id, null: false
      t.uuid :whoami_id
      t.string :status, default: 'open', null: false
      t.string :respondent
      t.string :answer
      t.integer :length, default: 1

      t.datetime :author_seen_at
      t.datetime :whoami_seen_at

      t.timestamps
    end
  end
end
