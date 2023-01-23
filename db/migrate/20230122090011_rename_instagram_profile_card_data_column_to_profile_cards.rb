class RenameInstagramProfileCardDataColumnToProfileCards < ActiveRecord::Migration[7.0]
  def change
    rename_column :profile_cards, :instagram_profile_card_data_g, :profile_card_data_g
    rename_column :profile_cards, :instagram_profile_card_data_h, :profile_card_data_h
    rename_column :profile_cards, :instagram_profile_card_data_i, :profile_card_data_i
    rename_column :profile_cards, :instagram_profile_card_data_j, :profile_card_data_j
    rename_column :profile_cards, :instagram_profile_card_data_k, :profile_card_data_k
    rename_column :profile_cards, :instagram_profile_card_data_l, :profile_card_data_l
  end
end
