class CreateBarcodes < ActiveRecord::Migration
  def change
    create_table :barcodes do |t|
      t.string :number
      t.integer :ware_id

      t.timestamps
    end
  end
end
