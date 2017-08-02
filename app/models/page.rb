class Page < ApplicationRecord
  default_scope -> { order(page_number: :asc) }
  belongs_to :map
  validates :page_number, presence: true, length: { maximum: 3 }
  validates :map_id, presence: true
  mount_uploader :image, ImageUploader
  validates :content, length: { maximum: 50 }
end
