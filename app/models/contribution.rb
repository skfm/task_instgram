class Contribution < ApplicationRecord
  validates :content, presence: true
  mount_uploader :picture, ImageUploader
  belongs_to :user
end
