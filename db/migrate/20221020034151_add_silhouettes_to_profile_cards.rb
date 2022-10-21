class AddSilhouettesToProfileCards < ActiveRecord::Migration[7.0]
  def change
    add_column :profile_cards, :binarize_image, :string
    add_column :profile_cards, :change_color_binarize_image, :string
  end
end
