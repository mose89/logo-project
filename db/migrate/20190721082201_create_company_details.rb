class CreateCompanyDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :company_details do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :email
      t.string :business_name
      t.integer :org_no
      t.string :address
      t.string :zip_code
      t.string :established
      t.string :referral
      t.boolean :gender
      t.references :order, foreign_key: true
      t.references :single_order, foreign_key: true

      t.timestamps
    end
  end
end
