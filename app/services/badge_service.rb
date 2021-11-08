
class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.all.each do |badge|
      create_badge(badge) if send(badge.badge_type, badge.badge_value)
    end
  end

 private

  def create_badge(badge)
    @user_badge = UserBadge.new(user_id: @user.id, badge_id: badge.id)

    errors.add(:badges, :invalid) unless @user_badge.save
  end

  def all_tests_at_category(category_title)
    return false if @test_passage.test.category.title != category_title
    
    @test_passage.passed && @user.where(passed: true, test: tests).tests.sort_by_category_title(category_title).uniq.count == Test.sort_by_category_title(category_title).count
  end

  def passed_test_at_first_attempt(*args)
    TestPassage.where(user: @test_passage.user, test: @test_passage.test).count == 1
  end

  def all_tests_at_level(level)
    
    return false if level.to_i != @test_passage.test.level
    tests = Test.where(level: level).pluck(:id)
    completed = @test_passage.user.test_passages.where(passed: true, test: tests).pluck(:test_id).uniq
    tests.count == completed.count
  end
end



