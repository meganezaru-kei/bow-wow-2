# == Schema Information
#
# Table name: posts
#
#  id              :bigint           not null, primary key
#  body            :text(65535)
#  child_category  :string(255)
#  parent_category :string(255)
#  title           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

class Post < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_many :post_tag_relations, dependent: :delete_all
  has_many :tags, through: :post_tag_relations
  belongs_to :user

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 1000 }
  validates :parent_category, presence: true
  validates :child_category, presence: true

  has_many_attached :images
  validates :images, presence: true, blob: {
    content_type: ['image/png', 'image/jpg', 'image/jpeg'],
    size_range: 1..5.megabytes
  }

  scope :recent, -> { order(created_at: :desc) }
  scope :user, ->(user_id) { where(user_id: user_id) }
  scope :category, ->(params) { where(child_category: params) }

  def self.user_posts_search(post_user_id, post_id)
    with_attached_images.recent.user(post_user_id).where.not(id: post_id)
  end

  def self.new_posts_search(post_id, post_user_id)
    with_attached_images.recent.where.not(id: post_id, user_id: post_user_id)
  end

  def save_tags(tag_list)
    tag_list.each do |tag|
      find_tag = Tag.find_by(tag_name: tag.downcase)
      if find_tag
        PostTagRelation.create!(post_id: id, tag_id: find_tag.id)
      else
        begin
          tags.create!(tag_name: tag)
        rescue StandardError
          nil
        end
      end
    end
  end
end
