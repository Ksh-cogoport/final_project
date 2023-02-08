class AddDescToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :desc, :string
  end
end
