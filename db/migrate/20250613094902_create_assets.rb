class CreateAssets < ActiveRecord::Migration[7.2]
  def change
    create_table :assets do |t|
      t.string :name
      t.jsonb :data

      t.timestamps
    end
  end
end
