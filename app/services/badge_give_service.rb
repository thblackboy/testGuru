class BadgeGiveService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      if badge.condition_param.present?
        @user.badges.push(badge) if eval("check_#{badge.condition_type}?('#{badge.condition_param}')")
      else
        @user.badges.push(badge) if eval("check_#{badge.condition_type}?")
      end
    end
  end

  private

  def check_first_time_passage?
    @user.tests.where(id: @test).count == 1
  end

  def check_all_tests_by_one_category_passage?(category_name)
    category = Category.where(title: category_name)
    @test.category == category &&
      @user.tests.uniq.where(category_id: category).count == Test.tests_by_category_name(category_name).count
  end

  def check_all_tests_by_one_level_passage?(level)
    @test.level == level.to_i &&
      @users.tests.uniq.where(level: level).count == Test.where(level: level).count
  end
end
