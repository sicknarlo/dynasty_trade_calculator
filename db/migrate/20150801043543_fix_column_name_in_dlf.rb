class FixColumnNameInDlf < ActiveRecord::Migration
  def change
    rename_column :dlf_ranks, :played_id, :player_id
  end
end
