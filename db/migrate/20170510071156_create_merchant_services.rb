class CreateMerchantServices < ActiveRecord::Migration[5.0]
  def change
    create_table :merchant_services do |t|
      t.integer :page_id #merchant_page
      t.integer :service_id
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
