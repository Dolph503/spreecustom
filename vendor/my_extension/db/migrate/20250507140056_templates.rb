class Templates < ActiveRecord::Migration[7.1]
  def change
    create_table :templates do |t|
      t.jsonb :data, null: false, default: {}

      t.timestamps
    end
  end
end
