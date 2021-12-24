class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :tests_by_authors, class_name: "Test", foreign_key: "author_id", dependent: :destroy

  def show_tests_by_level(level)
    self.tests.where(level: level)
  end
end
