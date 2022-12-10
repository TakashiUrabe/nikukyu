class CreateFavoriteTreatDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_treat_dogs do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :favorite_treat_dogs, :name, unique: true
  end
end
