class FixFullName < ActiveRecord::Migration
  def change
    rename_column :players, :full_name, :name
  end
end
