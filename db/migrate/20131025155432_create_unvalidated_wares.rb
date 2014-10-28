class CreateUnvalidatedWares < ActiveRecord::Migration
  def change
    create_table :unvalidated_wares do |t|
      t.string :barcode
      t.string :title
      t.text :comment
      t.integer :shop_id

      t.timestamps
    end
  end
end
