class AddStrippedNameToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :stripped_name, :string
  end
end
