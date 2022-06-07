class Childcare < ApplicationRecord
  has_many :applications, dependent: :destroy
  has_many :users, through: :applications
  has_many :reviews
  has_many :opening_hours
  validates :name, :url, presence: true
  validates :address, presence: true, uniqueness: true
  has_one_attached :photo
end
