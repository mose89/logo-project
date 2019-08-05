class AddImageToStyles < ActiveRecord::Migration[5.2]
  def change
    add_column :styles, :image, :string
  end
end
