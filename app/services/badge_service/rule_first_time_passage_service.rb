module BadgeService
  class RuleFirstTimePassageService
    def initialize(test_passage_id, *_param)
      test_passage = TestPassage.find(test_passage_id.to_i)
      @user = test_passage.user
      @test = test_passage.test
    end

    def call
      @user.tests.where(id: @test.id).count == 1
    end
  end
end
