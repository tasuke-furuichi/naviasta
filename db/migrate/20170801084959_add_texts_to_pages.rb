class AddTextsToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :text, :text
  end
end
