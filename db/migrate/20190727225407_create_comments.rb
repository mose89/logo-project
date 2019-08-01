class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.string :email
      t.string :name
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
