class BadgeGiveService
  RULES = {

    first_time_passage: FirstTimePassRuleSpecification,
    all_tests_by_one_category_passage: AllTestByOneCategoryRuleSpecification,
    all_tests_by_one_level_passage: AllTestByOneLevelRuleSpecification

  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.all.each do |badge|
      add_badge(badge) if RULES[badge.condition_type.to_sym].new(value: badge.condition_value,
                                                          test_passage: @test_passage).satisfies?
    end
  end

  private

  def add_badge(badge)
    @test_passage.user.badges.push(badge)
  end
end
