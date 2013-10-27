class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.integer :id_group
      t.integer :id_user

      t.timestamps
    end
  end
end
