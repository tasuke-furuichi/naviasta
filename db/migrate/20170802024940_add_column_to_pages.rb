class AddColumnToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :content, :string
  end
end
