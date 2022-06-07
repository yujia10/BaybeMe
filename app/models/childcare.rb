class Childcare < ApplicationRecord
  has_many :applications, dependent: :destroy
  has_many :users, through: :applications
  validates :name, :url, presence: true
  validates :address, :email, presence: true, uniqueness: true
  has_one_attached :photo
end
