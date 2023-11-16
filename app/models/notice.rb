class Notice < ApplicationRecord
  belongs_to :user

  validates :notice_title, presence: true
  validates :notice_text, presence: true
  validates :user_id, presence: true

end