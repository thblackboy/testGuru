class User < ApplicationRecord
  has_many :results
  has_many :tests
  def show_tests_by_level(level)
    Test.joins(:results).where(results: { user_id: id }).and(Test.where(level: level))
  end
end
