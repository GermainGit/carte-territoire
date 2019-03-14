class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :prenom, presence: true
  validates :nom, presence: true
  validates :email, presence: true

  has_many :photos, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def to_s
    "#{prenom}"
end
end
