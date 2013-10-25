class CreateCharacteristics < ActiveRecord::Migration
  def change
    create_table :characteristics do |t|
      t.integer :id_ware
      t.integer :id_prop
      t.integer :id_val
      t.integer :id_ext

      t.timestamps
    end
  end
end
