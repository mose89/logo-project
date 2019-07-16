class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :business_name, :string
    add_column :users, :org_no, :integer
    add_column :users, :address, :string
    add_column :users, :established, :integer
    add_reference :users, :industry, foreign_key: true
    add_column :users, :referral, :string
  end
end
