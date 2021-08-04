# == Schema Information
#
# Table name: test_passages
#
#  id                  :integer          not null, primary key
#  correct_questions   :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  current_question_id :integer
#  test_id             :integer          not null
#  user_id             :integer          not null
#
# Indexes
#
#  index_test_passages_on_current_question_id  (current_question_id)
#  index_test_passages_on_test_id              (test_id)
#  index_test_passages_on_user_id              (user_id)
#
# Foreign Keys
#
#  current_question_id  (current_question_id => questions.id)
#  test_id              (test_id => tests.id)
#  user_id              (user_id => users.id)
#
require 'test_helper'

class TestPassageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
