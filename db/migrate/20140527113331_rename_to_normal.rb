class RenameToNormal < ActiveRecord::Migration
  def change
    rename_column :characteristics, :id_prop, :property_id
    rename_column :characteristics, :id_val, :value_id
    rename_column :characteristics, :id_ware, :ware_id

    rename_column :wares, :id_cat, :category_id
    rename_column :wares, :id_parent, :parent_id

    rename_column :values, :id_prop, :property_id

    rename_column :unvalidated_wares, :id_client, :client_id

    rename_column :client_codes, :id_client, :client_id
    rename_column :client_codes, :id_barcode, :barcode_id

    rename_column :barcodes, :id_ware, :ware_id

    rename_table :cat_props, :category_properties

    rename_column :category_properties, :id_prop, :property_id
    rename_column :category_properties, :id_cat, :category_id

    rename_column :operation_logs, :id_type, :type_id

    rename_column :user_groups, :id_group, :group_id
    rename_column :user_groups, :id_user, :user_id

    rename_column :values, :value, :content

  end
end
