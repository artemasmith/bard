class AddTariffIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :tariff_id, :integer
  end
end
