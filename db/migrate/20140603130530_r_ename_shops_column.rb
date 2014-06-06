class REnameShopsColumn < ActiveRecord::Migration
  def change
    rename_column :shops, :client_id, :user_id
    rename_column :unvalidated_wares, :client_id, :user_id
    rename_column :client_codes, :client_id, :user_id
  end
end
