class CreateClientCodes < ActiveRecord::Migration
  def change
    create_table :user_codes do |t|
      t.integer :user_id
      t.integer :barcode_id
    end
  end
end
