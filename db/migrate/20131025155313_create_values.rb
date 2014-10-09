class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.string :content
      t.integer :id_ext
      t.integer :property_id

      t.timestamps
    end
  end
end
