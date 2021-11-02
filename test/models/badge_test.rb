# == Schema Information
#
# Table name: badges
#
#  id          :bigint           not null, primary key
#  badge_type  :string           not null
#  badge_value :string           not null
#  image_url   :string           not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class BadgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
