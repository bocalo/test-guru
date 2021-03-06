# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  test_id    :bigint
#
# Indexes
#
#  index_questions_on_test_id  (test_id)
#
# Foreign Keys
#
#  fk_rails_...  (test_id => tests.id)
#
class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :body, presence: true
end
