class RemoveSlugFromMap < ActiveRecord::Migration[5.0]
  def change
    remove_column :maps, :slug, :string
  end
end
