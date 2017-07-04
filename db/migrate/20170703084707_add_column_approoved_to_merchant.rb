class AddColumnApproovedToMerchant < ActiveRecord::Migration[5.0]
  def change
    add_column :merchant_pages, :approved, :boolean
  end
end
