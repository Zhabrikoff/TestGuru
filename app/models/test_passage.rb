class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_current_question, on: %i[create update]

  MINIMUM_SUCCESS_PERCENTAGE = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def test_successful?
    (correct_questions.to_f / test.questions.count * 100).round(2) >= MINIMUM_SUCCESS_PERCENTAGE
  end

  def time_left
    (test.timer * 60) - (Time.current - created_at).to_i
  end

  def time_is_up?
    time_left <= 0
  end

  private

  def before_validation_set_current_question
    if current_question.nil?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = next_question
    end
  end

  def next_question
    test.questions.order(:id).where("id > ?", current_question.id).first
  end

  def correct_answer?(answer_ids)
    !answer_ids.nil? && correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
