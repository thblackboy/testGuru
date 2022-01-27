module BadgeService
  class RuleAllTestsByOneLevelPassageService
    def initialize(test_passage_id, level)
      test_passage = TestPassage.find(test_passage_id.to_i)
      @user = test_passage.user
      @test = test_passage.test
      @level = level.to_i
      @success_tests = @user.tests.select('tests.*, test_passages.success')
                            .where(test_passages: { success: true }).order(id: :asc)
    end

    def call
      if @test.level == @level
        success_test_ids = @success_tests.where(tests: { level: @level }).ids
        test_ids = Test.where(level: @level).ids

        test_ids == success_test_ids.uniq &&
          success_test_ids.group_by(&:itself).values.map(&:size).uniq.size == 1
      end
    end
  end
end
