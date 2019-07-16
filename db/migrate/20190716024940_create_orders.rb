class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :logo_name
      t.string :slogan
      t.references :industry, foreign_key: true
      t.text :color
      t.references :style, foreign_key: true
      t.string :reference_logo
      t.boolean :active
      t.references :package, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
