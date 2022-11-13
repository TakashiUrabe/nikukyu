class ChangeColumnNullOnProfileCards < ActiveRecord::Migration[7.0]
  def change
    change_column_null :profile_cards, :name, false
  end
end
