# frozen_string_literal: true

class CategoryBadge < Badge
  def category_id
    rule_value
  end

  def check_condition(test_passage)
    return false unless test_passage.passed
    return false unless test_passage.test.category_id == category_id

    num_tests_of_category = Test.joins(:category).where(category_id: category_id).count
    if was_rewarded?(test_passage.user)
      last_rewarded = UserBadge.where(badge: self, user: test_passage.user).order(created_at: :desc).first.created_at
      passage_chart = test_passage.user.test_passages.where(passed: true).where('test_passages.created_at > ?', last_rewarded).joins(:test).where('tests.category_id=?', category_id).group(:test_id).count
    else
      passage_chart = test_passage.user.test_passages.where(passed: true).joins(:test).where('tests.category_id=?', category_id).group(:test_id).count
    end
    num_tests_of_category == passage_chart.keys.size
  end

  def description
    I18n.t(:desc, scope: localization_scope, category: Category.find(category_id).title)
  end
end
