class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.boolean :logo
      t.boolean :web_file
      t.boolean :favicon
      t.boolean :business_card
      t.boolean :black_white_logo
      t.boolean :separate_logo_symbol
      t.boolean :instagram_logo
      t.boolean :facebook_logo
      t.boolean :backup
      t.integer :amount_logo_proposal
      t.decimal :price
      t.string :amount_change
      t.boolean :satisfaction_guarantee

      t.timestamps
    end
  end
end
