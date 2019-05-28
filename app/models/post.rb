class Post < ApplicationRecord
  belongs_to :user
  has_many :compliments, dependent: :destroy
  mount_uploader :picture, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
