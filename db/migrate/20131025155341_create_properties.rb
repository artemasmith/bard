class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :title
      t.integer :id_ext

      t.timestamps
    end
  end
end
