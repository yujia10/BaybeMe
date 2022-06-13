class Childcare < ApplicationRecord
  has_many :applications, dependent: :destroy
  has_many :users, through: :applications
  has_many :reviews, dependent: :destroy
  has_many :opening_hours, dependent: :destroy
  # validates :name, :url, presence: true
  # validates :address, presence: true, uniqueness: true
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  acts_as_favoritable
end
