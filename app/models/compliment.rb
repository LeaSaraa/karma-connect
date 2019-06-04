class Compliment < ApplicationRecord
  belongs_to :user, autosave: true
  belongs_to :sender, class_name: "User"
end
