# frozen_string_literal: true

class LevelBadge < Badge

  def level
    rule_value
  end

  def check_condition(test_passage)
    return false unless test_passage.test.level == level

    num_tests_of_level = Test.where(level: level).count
    passage_chart = test_passage.user.test_passages.where(passed: true).joins(:test).where('tests.level=?', level).group(:test_id).count
    # received hash in form {test_id => passages_count}
    amount_condition = num_tests_of_level == passage_chart.keys.size
    # checked if user completed ALL tests
    all_condition = passage_chart.values.uniq.count == 1
    # checked if user completed tests equal amount of times

    amount_condition && all_condition
  end

  def description
    I18n.t(:desc, scope: localization_scope, level: level)
  end
end
