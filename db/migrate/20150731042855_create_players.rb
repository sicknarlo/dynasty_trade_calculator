class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :position_id
      t.integer :team_id
      t.boolean :rookie?, default: false
      t.boolean :active? ,default: true

      t.timestamps null: false
    end
  end
end
