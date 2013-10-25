class CreateCatProps < ActiveRecord::Migration
  def change
    create_table :cat_props do |t|
      t.integer :id_cat
      t.integer :id_prop

      t.timestamps
    end
  end
end
