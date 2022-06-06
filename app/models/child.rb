class Child < ApplicationRecord
  belongs_to :user
  has_many :applications, dependent: :destroy
  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  validates :dob, presence: true
end
