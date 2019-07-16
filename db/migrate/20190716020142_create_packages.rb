class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.boolean :logo
      t.boolean :web_filer
      t.boolean :favicon
      t.boolean :visitt_kort
      t.boolean :svart_hvit_logo
      t.boolean :separat_logo_symbol
      t.boolean :instagram_logo
      t.boolean :facebook_logo
      t.boolean :backup
      t.integer :antall_logo_forslag
      t.decimal :pris
      t.string :antall_endringer
      t.boolean :fornoyd_garanti

      t.timestamps
    end
  end
end
