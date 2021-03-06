class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :business_name, :string
    add_column :users, :org_no, :integer
    add_column :users, :address, :string
    add_column :users, :established, :integer
    add_column :users, :referral, :string
    add_column :users, :admin, :boolean
  end
end
