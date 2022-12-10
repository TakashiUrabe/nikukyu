class CreateFavoriteTreatCats < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_treat_cats do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :favorite_treat_cats, :name, unique: true
  end
end
