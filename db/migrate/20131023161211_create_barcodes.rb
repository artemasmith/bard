class CreateBarcodes < ActiveRecord::Migration
  def change
    create_table :barcodes do |t|
      t.string :number
      t.integer :id_ware

      t.timestamps
    end
  end
end
