class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.belongs_to :user, index: { unique: false }, foreign_key: true 
      t.timestamps
    end
  end
end
