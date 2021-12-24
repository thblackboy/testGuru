class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :tests_by_authors, class_name: "Test", foreign_key: "user_id"
  def show_tests_by_level(level)
    Test.joins('JOIN results ON tests.id = results.test_id')
    .where(results: { user_id: id})
    .where(level: level)
  end
end
