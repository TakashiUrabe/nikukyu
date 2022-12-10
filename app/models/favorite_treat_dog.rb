class FavoriteTreatDog < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
