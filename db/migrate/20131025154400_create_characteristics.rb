class CreateCharacteristics < ActiveRecord::Migration
  def change
    create_table :characteristics do |t|
      t.integer :ware_id
      t.integer :property_id
      t.integer :value_id
      t.integer :id_ext

      t.timestamps
    end
  end
end
