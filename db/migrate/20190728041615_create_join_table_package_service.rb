class CreateJoinTablePackageService < ActiveRecord::Migration[5.2]
  def change
    create_join_table :packages, :services do |t|
      t.index [:package_id, :service_id]
      # t.index [:category_id, :post_id]
    end
  end
end
