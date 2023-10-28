class Photo < ApplicationRecord
  # belong_to :user

  validates :photo_text, presence: true
  #validates :user, presence: true

end
