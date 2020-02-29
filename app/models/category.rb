# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  ancestry   :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_ancestry  (ancestry)
#

class Category < ApplicationRecord
  has_ancestry

  def self.parent_name_set(category_parent_array)
    where(ancestry: nil).find_each do |parent|
      category_parent_array << parent.name
    end
  end

  def self.child_name_set(category_child_array, ransack_q)
    parent = find_by(name: ransack_q.parent_category_eq)
    parent.children.each do |child|
      category_child_array += [{ id: child.id, name: child.name }]
    end
  end
end
