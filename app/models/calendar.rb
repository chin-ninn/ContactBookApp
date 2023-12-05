class Calendar < ApplicationRecord
  belongs_to :admins

  validates :event, presence: true
  validates :start_time, presence: true
  validates :admin_id, presence: true
end
