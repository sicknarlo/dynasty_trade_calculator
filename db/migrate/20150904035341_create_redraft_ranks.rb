class CreateRedraftRanks < ActiveRecord::Migration
  def change
    create_table :redraft_ranks do |t|

      t.integer :player_id
      t.integer :month_id
      t.integer :rank
      t.timestamps null: false
    end
  end
end
