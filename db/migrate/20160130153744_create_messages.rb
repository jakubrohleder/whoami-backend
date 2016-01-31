class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages, id: :uuid do |t|
      t.uuid :author_id, null: false
      t.uuid :conversation_id, null: false
      t.text :text, null: false

      t.timestamps
    end
  end
end
