class CreatePackageProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :package_products do |t|
      t.references :package, foreign_key: true
      t.references :product, foreign_key: true
    end
  end
end
