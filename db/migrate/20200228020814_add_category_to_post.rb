class AddCategoryToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :parent_category, :string
    add_column :posts, :child_category, :string
  end
end
