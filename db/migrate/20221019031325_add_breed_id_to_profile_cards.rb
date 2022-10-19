class AddBreedIdToProfileCards < ActiveRecord::Migration[7.0]
  def change
    add_reference :profile_cards, :breed, foreign_key: true
  end
end
