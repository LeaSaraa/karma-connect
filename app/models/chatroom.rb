class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  # validates :topic, presence: true, uniqueness: true, case_sensitive: false
end
