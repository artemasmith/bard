class AddStateToShops < ActiveRecord::Migration
  def change
    add_column :shops, :state, :integer, default: 0
  end
end
