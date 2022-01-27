module BadgeService
  class BadgeGiveService
    def initialize(test_passage)
      @test_passage = test_passage
    end

    def call
      Badge.all.each do |badge|
        @test_passage.user.badges.push(badge) if rule_service(badge)
      end
    end

    private

    def rule_service(badge)
      eval("Rule#{badge.condition_type}Service.new('#{@test_passage.id}', '#{badge.condition_param}')")
    end
  end
end
