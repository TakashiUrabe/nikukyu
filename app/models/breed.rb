class Breed < ApplicationRecord
  has_many :profile_cards, dependent: :restrict_with_exception

  validates :name, uniqueness: true, presence: true
  validates :kind, presence: true

  enum kind: { dog: 1, cat: 2}

  scope :dog_name, -> {where(kind: dog).order(id: :asc)}
  scope :cat_name, -> {where(kind: cat).order(id: :asc)}
end
