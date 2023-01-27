class AddWallpaperProfileCardDataToProfileCards < ActiveRecord::Migration[7.0]
  def change
    add_column :profile_cards, :profile_card_data_m, :string
    add_column :profile_cards, :profile_card_data_n, :string
    add_column :profile_cards, :profile_card_data_o, :string
    add_column :profile_cards, :profile_card_data_p, :string
    add_column :profile_cards, :profile_card_data_q, :string
    add_column :profile_cards, :profile_card_data_r, :string
  end
end
