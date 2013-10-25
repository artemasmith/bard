class CreateWares < ActiveRecord::Migration
  def change
    create_table :wares do |t|
      t.string :title
      t.integer :id_parent
      t.text :specs
      t.integer :id_cat
      t.integer :type
      t.integer :id_ext

      t.timestamps
    end
  end
end
