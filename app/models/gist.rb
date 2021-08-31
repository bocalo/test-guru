# == Schema Information
#
# Table name: gists
#
#  id          :integer          not null, primary key
#  gist_url    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer          not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_gists_on_question_id  (question_id)
#  index_gists_on_user_id      (user_id)
#
# Foreign Keys
#
#  question_id  (question_id => questions.id)
#  user_id      (user_id => users.id)
#
class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user
end
