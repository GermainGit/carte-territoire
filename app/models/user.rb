class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :prenom, presence: true
  validates :nom, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  has_many :photos
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def to_s
    "#{prenom}"
end
end
