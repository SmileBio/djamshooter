class AddColumnCompanyLogoToMerchantPage < ActiveRecord::Migration[5.0]
  def up
    add_attachment :merchant_pages, :company_logo
  end

  def down
    remove_attachment :merchant_pages, :company_logo
  end
end
