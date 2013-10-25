class CreateOperationTypes < ActiveRecord::Migration
  def change
    create_table :operation_types do |t|
      t.string :title

      t.timestamps
    end
  end
end
