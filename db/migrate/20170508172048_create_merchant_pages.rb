class CreateMerchantPages < ActiveRecord::Migration[5.0]
  def change
    create_table :merchant_pages do |t|
      t.string :company_name
      t.text :description
      t.string :phone
      t.integer :user_id
      t.timestamps
    end
  end
end
