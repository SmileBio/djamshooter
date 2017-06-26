class Region < ApplicationRecord
  has_many :cities, dependent: :delete_all

  validates :title, length: { in: 2..80 }
end
