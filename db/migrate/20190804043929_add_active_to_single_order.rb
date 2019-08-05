class AddActiveToSingleOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :single_orders, :active, :boolean
  end
end
