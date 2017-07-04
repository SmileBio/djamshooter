class Region < ApplicationRecord
  has_many :cities, dependent: :delete_all
  has_many :adverts
  has_many :users
  has_many :merchant_pages, through: :locations

  validates :title, length: { in: 2..80 }
end
