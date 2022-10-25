class AddProfileCardDataToProfileCards < ActiveRecord::Migration[7.0]
  def change
    add_column :profile_cards, :profile_card_data_a, :string
    add_column :profile_cards, :profile_card_data_b, :string
    add_column :profile_cards, :profile_card_data_c, :string
    add_column :profile_cards, :profile_card_data_d, :string
  end
end
