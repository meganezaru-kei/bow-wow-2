# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Post < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_many :post_tag_relations, dependent: :delete_all
  has_many :tags, through: :post_tag_relations 
  has_many_attached :images
  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1000 }
end
