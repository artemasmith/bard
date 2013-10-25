class CreateClientCodes < ActiveRecord::Migration
  def change
    create_table :client_codes do |t|
      t.integer :id_client
      t.integer :id_barcode

      t.timestamps
    end
  end
end
