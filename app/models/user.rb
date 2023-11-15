class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notices, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :calendars, dependent: :destroy

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'include both letters and numbers in password'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'use double-byte characters' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ンー]+\z/, message: 'use double-byte kana' } do
    validates :family_name_reading
    validates :first_name_reading
  end

  validates :relationship_id, presence: true, allow_blank: true, numericality: { other_than: 0, message: "can't be blank" }
  
  validates :phone_number, presence: true, numericality: { only_integer: true, message: 'use single-byte number' }
  validates :phone_number, length: { maximum: 11 }
  validates :phone_number, length: { minimum: 10 }
  
  validates :primary_care, presence: true, allow_blank: true
  validates :emergency_contact, presence: true, allow_blank: true
  
  validates :role, presence: true

  enum role: [ :service_user, :users_family, :admin ]

end
