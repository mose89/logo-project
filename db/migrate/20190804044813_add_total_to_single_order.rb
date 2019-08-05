class AddTotalToSingleOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :single_orders, :total, :integer
  end
end
