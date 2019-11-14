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

    Test.where(level: level).count <= test_passage.user.tests.where(level: level).count
  end

  def description
    "Completed all Tests with level #{level}"
  end
end
