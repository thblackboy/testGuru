module BadgeService
  class RuleAllTestsByOneCategoryPassageService
    def initialize(test_passage_id, category_id)
      test_passage = TestPassage.find(test_passage_id.to_i)
      @user = test_passage.user
      @test = test_passage.test
      @category_id = category_id.to_i
      @success_tests = @user.tests.select('tests.*, test_passages.success')
                            .where(test_passages: { success: true }).order(id: :asc)
    end

    def call
      if @test.category.id == @category_id
        success_test_ids = @success_tests.where(tests: { category_id: @category_id }).ids
        test_ids = Test.where(category_id: @category_id).ids

        test_ids == success_test_ids.uniq &&
          success_test_ids.group_by(&:itself).values.map(&:size).uniq.size == 1
      end
    end
  end
end
