class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :compliments, dependent: :destroy
  belongs_to :neighbourhood, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :upload_avatar, PhotoUploader
  has_many :messages, dependent: :destroy
  has_many :chatrooms, through: :messages
  # validates :first_name, presence: true, uniqueness: true
  # validates :first_name, :last_name, :email, :upload_avatar, :personal_info, presence: true
end
