class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.belongs_to :user, index: { unique: false }, foreign_key: true
      t.belongs_to :post, index: { unique: false }, foreign_key: true
      t.timestamps
    end
  end
end
