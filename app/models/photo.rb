class Photo < ApplicationRecord
  belongs_to :admins
  has_many_attached :images

  validates :images, presence: true
  validates :photo_text, presence: true
  validates :admin_id, presence: true

end
