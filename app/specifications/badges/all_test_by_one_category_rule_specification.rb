module Badges
  class AllTestByOneCategoryRuleSpecification < AbstractBadgeRuleSpecification
    def satisfies?
      category_id = @value.to_i
      if @test.category.id == category_id
        success_test_ids = @success_tests.where(tests: { category_id: category_id }).ids
        test_ids = Test.where(category_id: category_id).ids

        test_ids == success_test_ids.uniq &&
          success_test_ids.group_by(&:itself).values.map(&:size).uniq.size == 1
      else
        false
      end
    end
  end
end
