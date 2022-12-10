class FavoriteTreatCat < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
