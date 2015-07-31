class CreateDlfRanks < ActiveRecord::Migration
  def change
    create_table :dlf_ranks do |t|
      t.integer :played_id
      t.integer :month_id

      t.timestamps null: false
    end
  end
end
