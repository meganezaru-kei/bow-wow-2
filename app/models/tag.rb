# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  tag_name   :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  before_save :downcase_tag_name
  
  has_many :post_tag_relations, dependent: :delete_all
  has_many :posts, through: :post_tag_relations

  validates :tag_name, presence: true, uniqueness: true

  private

  def downcase_tag_name
    tag_name.downcase!
  end
end
