class CreateShopsWares < ActiveRecord::Migration
  def change
    create_table :shops_wares do |t|
      t.integer :shop_id
      t.integer :ware_id
    end
  end
end
