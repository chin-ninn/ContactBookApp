class Calendar < ApplicationRecord
  # belongs_to :user

  validates :event, presence: true
  validates :start_time, presence: true
  # validates :user, presence: true
end