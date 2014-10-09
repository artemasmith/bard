class CreateWares < ActiveRecord::Migration
  def change
    create_table :wares do |t|
      t.string :title
      t.integer :parent_id
      t.text :specs
      t.integer :category_id
      t.integer :ware_type
      t.integer :id_ext

      t.timestamps
    end
  end
end
