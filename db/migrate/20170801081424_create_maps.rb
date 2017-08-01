class CreateMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :maps do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :status
      t.string :language

      t.timestamps
    end
  end
end
