class AddTwitterShareProfileCardDataToProfileCards < ActiveRecord::Migration[7.0]
  def change
    add_column :profile_cards, :twitter_share_profile_card_data_a, :string
    add_column :profile_cards, :twitter_share_profile_card_data_b, :string
    add_column :profile_cards, :twitter_share_profile_card_data_c, :string
    add_column :profile_cards, :twitter_share_profile_card_data_d, :string
    add_column :profile_cards, :twitter_share_profile_card_data_e, :string
    add_column :profile_cards, :twitter_share_profile_card_data_f, :string
  end
end
