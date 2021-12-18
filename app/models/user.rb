class User < ApplicationRecord
  def show_tests_by_level(level)
    tests = Result.where(user_id: id).pluck(:test_id)
    Test.where(id: tests).and(Test.where(level: level))
  end
end
