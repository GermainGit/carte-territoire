class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :prenom, presence: true
  validates :nom, presence: true
  validates :email, presence: true

  validate :file_size_validation

  has_many :photos, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def to_s
    "#{prenom}"
end
  private

  def file_size_validation
    errors[:file] << "Le fichier doit être inférieur à 5 Mo" if file.size > 5.megabytes
  end
end
