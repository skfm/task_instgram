class Contribution < ApplicationRecord
  validates :content, presence: true
  mount_uploader :picture, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
