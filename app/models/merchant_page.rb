class MerchantPage < ApplicationRecord

  belongs_to :user
  has_many :merchant_services, class_name: "MerchantService", foreign_key: :page_id

  accepts_nested_attributes_for :merchant_services, allow_destroy: true
end
