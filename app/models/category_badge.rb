# frozen_string_literal: true

class CategoryBadge < Badge
  def self.rule_desc
    'Completed all Tests with Category'
  end

  def category_id
    rule_value
  end

  def check_condition(test_passage)
    return false unless test_passage.test.category_id == category_id

    passed_category_tests_count = test_passage.user.test_passages.where(passed: true).joins(:test).where('tests.category_id=?', category_id).count
    Test.joins(:category).where(category_id: category_id).count <= passed_category_tests_count
  end

  def description
    "Completed all Tests with Category #{Category.find(category_id).title}"
  end
end
