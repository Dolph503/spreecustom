class AddCustomDesignToLineItems < ActiveRecord::Migration[7.2]
  def change
    add_column :spree_line_items, :custom_design_json, :text
  end
end
