class AddColumnToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :like_count, :Integer
    
  end
end
