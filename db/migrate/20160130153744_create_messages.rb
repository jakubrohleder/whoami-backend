class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages, id: :uuid do |t|
      t.uuid :author
      t.uuid :conversation
      t.text :text

      t.timestamps
    end
  end
end
