class AddColRankToDlf < ActiveRecord::Migration
  def change
    add_column :dlf_ranks, :rank, :integer
  end
end
