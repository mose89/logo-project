class CreateOrderNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :order_notes do |t|
      t.text :description
      t.references :order, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
