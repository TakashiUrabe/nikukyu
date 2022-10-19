class CreateBreeds < ActiveRecord::Migration[7.0]
  def change
    create_table :breeds do |t|
      t.string :name, null: false, unique: true
      t.integer :kind, null: false

      t.timestamps
    end
  end
end
