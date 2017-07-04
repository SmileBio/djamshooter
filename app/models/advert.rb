class Advert < ApplicationRecord

  belongs_to :user
  belongs_to :region
  belongs_to :city
  validates :title, length: { in: 5..200 }
  validates :description, length: { in: 5..1000 }
end
