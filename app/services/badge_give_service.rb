class BadgeGiveService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @success_tests = @user.tests.select('tests.*, test_passages.success')
                          .where(test_passages: { success: true }).order(id: :asc)
  end

  def call
    puts Badge.all
    Badge.all.each do |badge|
      if badge.condition_param.present?
        @user.badges.push(badge) if send("check_#{badge.condition_type}?", badge.condition_param)
      else 
        @user.badges.push(badge) if send("check_#{badge.condition_type}?")
      end
    end
  end

  private

  def check_first_time_passage?
    @user.tests.where(id: @test.id).count == 1
  end

  def check_all_tests_by_one_category_passage?(category_id)
    if @test.category.id == category_id.to_i
      success_test_ids = @success_tests.where(tests: { category_id: category_id }).ids
      test_ids = Test.where(category_id: category_id).ids

      test_ids == success_test_ids.uniq &&
        success_test_ids.group_by(&:itself).values.map(&:size).uniq.size == 1
    end
  end

  def check_all_tests_by_one_level_passage?(level)
    if @test.level == level.to_i
      success_test_ids = @success_tests.where(tests: { level: level }).ids
      test_ids = Test.where(level: level).ids

      test_ids == success_test_ids.uniq &&
        success_test_ids.group_by(&:itself).values.map(&:size).uniq.size == 1
    end
  end
end
