class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct__answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def result_testing_in_percentages
    self.correct_questions.to_f / self.test.questions.count * 100
  end

  def current_question_number
    passed_questions_count + 1
  end

  private

  def correct__answer?(answer_ids)
    answer_ids = [] if answer_ids.nil?
    correct__answers_count = correct__answers.count
    (correct__answers_count == correct__answers.where(id: answer_ids).count) &&
      (correct__answers_count == answer_ids.count)
  end

  def correct__answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def passed_questions_count
    test.questions.order(:id).where('id < ?', current_question.id).count
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = next_question
  end
end
