# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  body        :text             not null
#  correct     :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validates :correct, presence: true
  validate :validate_max_length, on: :create
  
  scope :correct, -> { where(correct: true) }

  private

  def validate_max_length
    errors.add(:question) if question.answers.length >= 4
  end
end
