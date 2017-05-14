class Category < ApplicationRecord

  has_many :sub_categories, class_name: "Category", foreign_key: :parent_id, dependent: :delete_all
  belongs_to :parent, class_name: "Category"
  has_many :services

  scope :roots, -> { where("parent_id is NULL") }

  def root_category?
    self.parent_id.nil?
  end

end
