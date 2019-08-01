class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :logo_name
      t.string :slogan
      t.string :industry_id
      t.string :color
      t.string :reference_logo
      t.boolean :active
      t.string :style_id
      t.string :package_id

      t.timestamps
    end
  end
end
