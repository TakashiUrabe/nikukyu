class CreateProfileCards < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_cards do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :kind, null:false
      t.integer :gender
      t.date :birthday
      t.string :face_image
      t.string :pad_image, null:false
      t.string :favorite_toy
      t.string :favorite_treat
      t.integer :personality
      t.integer :card_type

      t.timestamps
    end
  end
end
