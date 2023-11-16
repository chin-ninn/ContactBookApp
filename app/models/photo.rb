class Photo < ApplicationRecord
  belong_to :user
  has_many_attached :images

  validates :images, presence: true
  validates :photo_text, presence: true
  validates :user_id, presence: true

end
