class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.integer :page_number
      t.string :image
      t.references :map, foreign_key: true

      t.timestamps
    end
  end
end
