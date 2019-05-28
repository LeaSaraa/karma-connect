class User < ApplicationRecord
  belongs_to :neighbourhood
  has_many :posts, dependent: :destroy
  has_many :compliments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :upload_avatar, PhotoUploader
end
