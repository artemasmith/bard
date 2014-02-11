class GroupsWares < ActiveRecord::Migration
  def change
    create_table :groups_wares do |t|
      t.integer :id_parent
      t.integer :ware_id
      
    end
  end
end
