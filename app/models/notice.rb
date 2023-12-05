class Notice < ApplicationRecord
  belongs_to :admins

  validates :notice_title, presence: true
  validates :notice_text, presence: true
  validates :admin_id, presence: true

end