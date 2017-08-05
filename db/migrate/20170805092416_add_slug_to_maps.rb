class AddSlugToMaps < ActiveRecord::Migration[5.0]
  def change
    add_column :maps, :slug, :string
    add_index :maps, :slug
  end
end
