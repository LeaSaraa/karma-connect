class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :compliments, dependent: :destroy
  belongs_to :neighbourhood, optional: true
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :upload_avatar, PhotoUploader

  validates :first_name, :last_name, :email, :upload_avatar, :personal_info, presence: true
end
