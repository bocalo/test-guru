# == Schema Information
#
# Table name: test_users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tests_id   :integer          not null
#  users_id   :integer          not null
#
# Indexes
#
#  index_test_users_on_tests_id  (tests_id)
#  index_test_users_on_users_id  (users_id)
#
# Foreign Keys
#
#  tests_id  (tests_id => tests.id)
#  users_id  (users_id => users.id)
#
require 'test_helper'

class TestUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
