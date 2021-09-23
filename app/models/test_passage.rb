# == Schema Information
#
# Table name: test_passages
#
#  id                  :bigint           not null, primary key
#  correct_questions   :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  current_question_id :bigint
#  test_id             :bigint           not null
#  user_id             :bigint           not null
#
# Indexes
#
#  index_test_passages_on_current_question_id  (current_question_id)
#  index_test_passages_on_test_id              (test_id)
#  index_test_passages_on_user_id              (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (current_question_id => questions.id)
#  fk_rails_...  (test_id => tests.id)
#  fk_rails_...  (user_id => users.id)
#
class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question

  def passed?
    result >= SUCCESS_PERCENT
  end

  def result
    ((self.correct_questions.to_f / test.questions.count.to_f) * 100).to_i
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1 
    end

    save
  end

  def current_question_index
    test.questions.index(current_question)
  end

  def current_question_number
    current_question_index + 1
  end

  def percent_of_progress
    (current_question_index.to_f / test.questions.count.to_f * 100).to_i
  end

  private

  def before_validation_set_question
    self.current_question = self.completed? ? test.questions.first : next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids.present?
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
