class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def time_over?
    end_time < Time.current
  end

  def accept!(answer_ids)
    if time_over?
      self.current_question = nil
    elsif correct__answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def successful?
    success_ratio >= 85
  end

  def success_ratio
    self.correct_questions.to_f / self.test.questions.count * 100
  end

  def current_question_number
    passed_questions_count + 1
  end

  def passed_questions_count
    test.questions.order(:id).where('id < ?', current_question.id).count
  end

  def end_time_to_ms
    end_time.to_f * 1000
  end

  def end_time
    created_at + test.time_execution.minutes
  end

  private

  def correct__answer?(answer_ids)
    correct__answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct__answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      self.current_question = test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first if current_question.present?
    end
  end

  def before_validation_set_current_question
    self.current_question = next_question
  end
end
