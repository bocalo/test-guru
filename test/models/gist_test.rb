# == Schema Information
#
# Table name: gists
#
#  id          :bigint           not null, primary key
#  gist_url    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_gists_on_question_id  (question_id)
#  index_gists_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class GistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
