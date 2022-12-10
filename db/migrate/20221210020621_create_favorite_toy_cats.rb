class CreateFavoriteToyCats < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_toy_cats do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :favorite_toy_cats, :name, unique: true
  end
end
