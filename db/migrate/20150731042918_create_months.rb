class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.string :mon
      t.string :year
      t.string :month_index

      t.timestamps null: false
    end
  end
end
