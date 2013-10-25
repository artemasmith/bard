class CreateUnvalidatedWares < ActiveRecord::Migration
  def change
    create_table :unvalidated_wares do |t|
      t.string :barode
      t.string :comment
      t.integer :id_client

      t.timestamps
    end
  end
end
