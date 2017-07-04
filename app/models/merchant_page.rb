class MerchantPage < ApplicationRecord

  belongs_to :user
  has_many :merchant_services, class_name: "MerchantService", foreign_key: :page_id
  has_and_belongs_to_many :categories
  has_many :galeries
  has_many :cities, through: :locations
  has_many :regions, through: :locations

  accepts_nested_attributes_for :merchant_services, allow_destroy: true
  accepts_nested_attributes_for :galeries, :allow_destroy => true

  has_attached_file :company_logo,
                  styles: { thumb: ["64x64#", :png],
                            original: ['500x500>', :png] }
  #validates :company_logo, attachment_presence: true
  validates_attachment_content_type :company_logo, content_type:["image/jpg", "image/jpeg", "image/png", "image/gif"], message: "невалидный формат файла"
end
