class Post < ApplicationRecord
  belongs_to :user
  has_many :compliments, dependent: :destroy
  mount_uploader :picture, PhotoUploader
end
