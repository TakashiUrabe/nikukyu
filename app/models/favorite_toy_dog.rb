class FavoriteToyDog < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
