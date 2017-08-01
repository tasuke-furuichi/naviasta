class Map < ApplicationRecord
  belongs_to :user
  has_many :pages
  validates :name, presence: true, length: { maximum: 50 }
  validates :status, presence: true, length: { maximum: 10 }
  validates :user_id, presence: true
  validates :language, presence: true, length: { maximum: 10 }
end