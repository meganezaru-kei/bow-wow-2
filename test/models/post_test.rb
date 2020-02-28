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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
