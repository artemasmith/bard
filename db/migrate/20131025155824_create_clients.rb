class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :title
      t.text :specs
      t.string :login
      t.string :pass
      t.boolean :blocked

      t.timestamps
    end
  end
end
