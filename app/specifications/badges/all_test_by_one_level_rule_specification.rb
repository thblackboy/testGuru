module Badges
  class AllTestByOneLevelRuleSpecification < AbstractBadgeRuleSpecification
    def satisfies?
      level = @value.to_i
      if @test.level == level
        success_test_ids = @success_tests.where(tests: { level: level }).ids
        test_ids = Test.where(level: level).ids

        test_ids == success_test_ids.uniq &&
          success_test_ids.group_by(&:itself).values.map(&:size).uniq.size == 1
      end
    end
  end
end
