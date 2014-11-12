class CreateAlcoholMakers < ActiveRecord::Migration
  def change
    create_table :alcohol_makers do |t|
      t.string :title
      t.string :inn
      t.string :kpp
      t.boolean :importer
      t.string :license
      t.date :license_expire
      t.integer :region

      t.timestamps
    end

    add_column :wares, :alcohol, :boolean, default: false
    add_column :wares, :producer_id, :integer
    add_column :wares, :capacity, :decimal
    add_column :wares, :strength, :decimal
  end
end
