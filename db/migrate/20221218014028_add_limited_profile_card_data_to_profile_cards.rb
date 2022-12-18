class AddLimitedProfileCardDataToProfileCards < ActiveRecord::Migration[7.0]
  def change
    add_column :profile_cards, :limited_profile_card_data_e, :string
    add_column :profile_cards, :limited_profile_card_data_f, :string
  end
end
