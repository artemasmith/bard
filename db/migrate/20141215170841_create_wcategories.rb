class CreateWcategories < ActiveRecord::Migration
  def change
    create_table :wcategories do |t|
      t.string :title
      t.integer :parent_id

      t.timestamps
    end
  end
end
