class AddAltTitleToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :alt_title, :string
  end
end
