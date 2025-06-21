class CreateFonts < ActiveRecord::Migration[7.1]
  def change
    create_table :fonts do |t|
      t.string :name

      t.timestamps
    end
  end
end
