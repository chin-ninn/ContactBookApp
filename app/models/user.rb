class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notices, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :calendars, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'include both letters and numbers in password'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'use double-byte characters' } do
    validates :name
  end

  with_options presence: true, format: { with: /\A[ァ-ンー]+\z/, message: 'use double-byte kana' } do
    validates :name_reading
  end
  
  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :prefecture_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :city,presence: true
  validates :house_number,presence: true

  validates :phone_number, presence: true, numericality: { only_integer: true, message: 'use single-byte number' }
  validates :phone_number, length: { maximum: 11 }
  validates :phone_number, length: { minimum: 10 }
  
  validates :phone_number, numericality: { only_integer: true, message: 'use single-byte number' }
  validates :phone_number, length: { maximum: 11 }
  validates :phone_number, length: { minimum: 10 }

  
end
