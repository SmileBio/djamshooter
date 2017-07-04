class CreateJoinTableCategoriesMerchantPages < ActiveRecord::Migration[5.0]
  def change
    create_join_table :categories, :merchant_pages do |t|
      t.index [:category_id, :merchant_page_id], :unique => true, :name => 'category_merchant_page'
      t.index [:merchant_page_id, :category_id], :unique => true, :name => 'merchant_page_category'
    end
  end
end
