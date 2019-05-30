class Post < ApplicationRecord
  belongs_to :user
  has_many :compliments, dependent: :destroy
  has_many :comments

  validates :address, presence: true

  mount_uploader :picture, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # STATUSES = ["Done", "Active"]
  # validates :status, inclusion: { in: STATUSES }
end
