class MerchantPage < ApplicationRecord

  belongs_to :user
  has_many :merchant_services, class_name: "MerchantService", foreign_key: :page_id

end
