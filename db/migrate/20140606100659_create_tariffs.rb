class CreateTariffs < ActiveRecord::Migration
  def change
    create_table :tariffs do |t|
      t.string :title
      t.decimal :cost
      t.integer :shops_count
      t.integer :categories_count

      t.timestamps
    end
    change_column :activities, :amount_debet, :decimal, default: 0.0
    change_column :activities, :amount_credit, :decimal, default: 0.0
  end
end
