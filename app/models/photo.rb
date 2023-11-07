class Photo < ApplicationRecord
  # belong_to :user
  has_one_attached :image

  validates :photo_text, presence: true
  #validates :user, presence: true

end
