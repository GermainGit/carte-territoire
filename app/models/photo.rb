class Photo < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true
  validates :long, presence: true
  validates :lat, presence: true
  belongs_to :user
  mount_uploader :file, FileUploader
  # validates :file, :presence => true

end
