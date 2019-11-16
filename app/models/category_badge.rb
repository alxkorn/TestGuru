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

    # passed_category_tests_count = test_passage.user.test_passages.where(passed: true).joins(:test).where('tests.category_id=?', category_id).count
    # Test.joins(:category).where(category_id: category_id).count <= passed_category_tests_count
    num_tests_of_category = Test.joins(:category).where(category_id: category_id).count
    passage_chart = test_passage.user.test_passages.where(passed: true).joins(:test).where('tests.category_id=?', category_id).group(:test_id).count
    amount_condition = num_tests_of_category == passage_chart.keys.size
    all_condition = passage_chart.values.uniq.count == 1

    amount_condition && all_condition
  end

  def description
    "Completed all Tests with Category #{Category.find(category_id).title}"
  end
end
