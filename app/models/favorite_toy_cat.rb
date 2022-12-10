class FavoriteToyCat < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
