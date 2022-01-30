module Badges
  class FirstTimePassRuleSpecification < AbstractBadgeRuleSpecification
    def satisfies?
      @user.tests.where(id: @test.id).count == 1
    end
  end
end
