class CreatePackageServices < ActiveRecord::Migration[5.2]
  def change
    create_table :package_services do |t|
      t.references :package, foreign_key: true
      t.references :service, foreign_key: true
    end
  end
end
