class Service < ApplicationRecord
  belongs_to :category
  has_many :merchant_services
end
