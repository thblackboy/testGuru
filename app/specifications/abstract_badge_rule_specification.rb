class AbstractBadgeRuleSpecification
  def initialize(value:, test_passage:)
    @value = value
    @test = test_passage.test
    @user = test_passage.user
    @success_tests = @user.tests.select('tests.*, test_passages.success')
                            .where(test_passages: { success: true }).order(id: :asc)
  end

  def satisfies?
    raise "#{__method__} undefined for #{self.class}"
  end
end
