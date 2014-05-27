class RenameTypeColumn < ActiveRecord::Migration
  def change
    rename_column :wares, :type, :ware_type
  end
end
