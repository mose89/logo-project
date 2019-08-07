class CreateSingleOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :single_orders do |t|
      t.string :design
      t.integer :total
      t.boolean :active
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
