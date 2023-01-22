class AddInstagramProfileCardDataToProfileCards < ActiveRecord::Migration[7.0]
  def change
    add_column :profile_cards, :instagram_profile_card_data_g, :string
    add_column :profile_cards, :instagram_profile_card_data_h, :string
    add_column :profile_cards, :instagram_profile_card_data_i, :string
    add_column :profile_cards, :instagram_profile_card_data_j, :string
    add_column :profile_cards, :instagram_profile_card_data_k, :string
    add_column :profile_cards, :instagram_profile_card_data_l, :string
  end
end
