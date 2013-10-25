class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.integer :id_prop
      t.string :value
      t.integer :id_ext

      t.timestamps
    end
  end
end
