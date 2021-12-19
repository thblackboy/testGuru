class User < ApplicationRecord
  def show_tests_by_level(level)
    Test.joins('JOIN results ON tests.id = results.test_id').where('results.user_id = :user_id',
                                                                   user_id: id).and(Test.where(level: level))
  end
end
