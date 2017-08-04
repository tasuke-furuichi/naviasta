class Map < ApplicationRecord
  #default_scope -> { order(page_number: :asc) }
  belongs_to :user
  has_many :pages, :dependent => :destroy
  validates :name, presence: true, length: { maximum: 50 }
  validates :status, presence: true, length: { maximum: 10 }
  validates :user_id, presence: true
  validates :language, presence: true, length: { maximum: 10 }
end
