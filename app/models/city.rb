class City < ApplicationRecord

  belongs_to :region
  has_many :users
  has_and_belongs_to_many :users
  has_many :adverts
  has_many :merchant_pages, through: :locations

  validates :title, length: { in: 3..70 }
end
