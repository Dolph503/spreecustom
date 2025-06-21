class AddTemplateIdToSpreeProducts < ActiveRecord::Migration[7.2]
  def change
    add_reference :spree_products, :template, foreign_key: true
  end
end
