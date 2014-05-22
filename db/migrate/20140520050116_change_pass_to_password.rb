class ChangePassToPassword < ActiveRecord::Migration
  def change
    rename_column :clients, :pass, :password
  end
end
