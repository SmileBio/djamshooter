class Galery < ApplicationRecord

  belongs_to :merchant_page
  has_many :images

  validates :title, presence: true
  accepts_nested_attributes_for :images, :allow_destroy => true
end
