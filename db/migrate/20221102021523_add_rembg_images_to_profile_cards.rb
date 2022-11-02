class AddRembgImagesToProfileCards < ActiveRecord::Migration[7.0]
  def change
    add_column :profile_cards, :rembg_face_image, :string
    add_column :profile_cards, :rembg_pad_image, :string
  end
end
