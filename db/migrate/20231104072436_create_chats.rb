class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.string :name
      t.references :user, null: true

      t.timestamps
    end
  end
end
