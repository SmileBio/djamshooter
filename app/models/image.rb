class Image < ApplicationRecord

  belongs_to :galery

  has_attached_file :image,
                  styles: { thumb: ["64x64#", :png],
                            medium: ["300x300>", :png],
                            original: ['500x500>', :png] }

  validates :image, attachment_presence: true
  validates_attachment_content_type :image, content_type:["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
