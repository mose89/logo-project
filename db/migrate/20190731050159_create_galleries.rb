class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.string :header
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
