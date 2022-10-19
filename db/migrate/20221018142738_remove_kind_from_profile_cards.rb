class RemoveKindFromProfileCards < ActiveRecord::Migration[7.0]
  def change
    remove_column :profile_cards, :kind, :integer
  end
end
