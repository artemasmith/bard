class CreateCategoriesShops < ActiveRecord::Migration
  def change
    #drop_table :categories_client_shops
    create_table :categories_shops do |t|
      t.integer :category_id
      t.integer :shop_id
    end
  end
end

