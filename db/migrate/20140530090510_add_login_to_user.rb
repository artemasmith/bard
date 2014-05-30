class AddLoginToUser < ActiveRecord::Migration
  def change
    add_column :users, :login, :integer
    add_column :users, :specs, :text
  end
end
