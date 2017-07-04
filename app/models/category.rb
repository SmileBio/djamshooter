class Category < ApplicationRecord



  has_many :sub_categories, class_name: "Category", foreign_key: :parent_id, dependent: :delete_all
  belongs_to :parent, class_name: "Category"
  has_many :services
  has_and_belongs_to_many :merchant_pages

  accepts_nested_attributes_for :merchant_pages

  has_attached_file :icon,
                  styles: { thumb: ["64x64#", :png],
                            original: ['500x500>', :png] }

  validates :title, presence: true

  validates :icon, attachment_presence: true
  validates_attachment_content_type :icon, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  scope :roots, -> { where("parent_id is NULL") }

  def root_category?
    self.parent_id.nil?
  end

  def name_with_initial
    "#{icon.url(:original)} | #{title}"
  end

end
