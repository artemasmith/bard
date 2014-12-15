class CreateWaresWcategories < ActiveRecord::Migration
  def change
    create_table :wares_wcategories do |t|
      t.integer :ware_id
      t.integer :wcategory_id
    end
  end
end
