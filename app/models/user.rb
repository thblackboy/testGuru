class User < ApplicationRecord
  def show_tests_by_level(level)
    Test.joins('JOIN results ON tests.id = results.test_id')
    .where(results: { user_id: id})
    .where(level: level)
  end
end
