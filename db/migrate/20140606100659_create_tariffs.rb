class CreateTariffs < ActiveRecord::Migration
  def change
    create_table :tariffs do |t|
      t.string :title
      t.decimal :cost
      t.integer :shops_count
      t.integer :categories_count

      t.timestamps
    end
  end
end
