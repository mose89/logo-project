class CreateSingleOrderNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :single_order_notes do |t|
      t.text :description
      t.references :single_order, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
