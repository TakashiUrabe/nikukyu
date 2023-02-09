class AddDisplayCardToProfileCards < ActiveRecord::Migration[7.0]
  def change
    add_column :profile_cards, :display_card, :boolean, default: true, null: false
  end
end
