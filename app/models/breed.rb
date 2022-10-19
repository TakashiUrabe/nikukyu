class Breed < ApplicationRecord
  has_many :profile_cards, dependent: :restrict_with_exception

  validates :name, uniqueness: true, presence: true
  validates :kind, presence: true
end
