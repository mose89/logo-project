class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :navn
      t.text :beskrivelse
      t.decimal :pris

      t.timestamps
    end
  end
end
