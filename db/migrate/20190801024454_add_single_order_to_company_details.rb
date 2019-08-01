class AddSingleOrderToCompanyDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :company_details, :single_order, foreign_key: true
  end
end
