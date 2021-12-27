class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate validate_answers_count

  private

  def validate_answers_count
    errors.add(:question) if answers.count < 1 && answers.count > 4
  end
end
