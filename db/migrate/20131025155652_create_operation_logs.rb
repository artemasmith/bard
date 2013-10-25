class CreateOperationLogs < ActiveRecord::Migration
  def change
    create_table :operation_logs do |t|
      t.integer :id_type
      t.string :event
      t.datetime :time

      t.timestamps
    end
  end
end
