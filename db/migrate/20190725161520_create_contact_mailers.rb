class CreateContactMailers < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_mailers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :message

      t.timestamps
    end
  end
end
