class MerchantService < ApplicationRecord

  belongs_to :service
  belongs_to :merchant_page#, class_name: "MerchantPage"#, foreign_key: :page_id

end
