# frozen_string_literal: true

class LevelBadge < Badge
  def self.rule_desc
    'Completed all Tests with Level'
  end

  def level
    rule_value
  end

  def check_condition(test_passage)
    return false unless test_passage.test.level == level

    # Test.where(level: level).count <= test_passage.user.tests.where(level: level).count
    num_tests_of_level = Test.where(level: level).count
    passage_chart = test_passage.user.test_passages.where(passed: true).joins(:test).where('tests.level=?', level).group(:test_id).count
    amount_condition = num_tests_of_level == passage_chart.keys.size
    all_condition = passage_chart.values.uniq.count == 1

    amount_condition && all_condition
  end

  def description
    "Completed all Tests with level #{level}"
  end
end
