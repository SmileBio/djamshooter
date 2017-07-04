class Location < ApplicationRecord
  belongs_to :merchant_page
  belongs_to :city
  belongs_to :region
end
