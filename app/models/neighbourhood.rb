class Neighbourhood < ApplicationRecord
  has_many :users, dependent: :destroy
end
