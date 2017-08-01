class Page < ApplicationRecord
  belongs_to :map
  validates :page_number, presence: true, length: { maximum: 3 }
  validates :map_id, presence: true
  mount_uploader :image, ImageUploader
end
