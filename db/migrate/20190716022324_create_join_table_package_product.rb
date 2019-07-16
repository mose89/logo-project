class CreateJoinTablePackageProduct < ActiveRecord::Migration[5.2]
  def change
    create_join_table :packages, :products do |t|
      t.index [:package_id, :product_id]
      # t.index [:product_id, :package_id]
    end
  end
end
