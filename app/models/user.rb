class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :children, dependent: :destroy
  has_many :applications, through: :children
  validates :address, :phone_number, presence: true
  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true,uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_favoritor
end
