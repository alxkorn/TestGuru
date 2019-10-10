# frozen_string_literal: true

class User < ApplicationRecord
  def passed_tests_by_level(level)
    Test.joins('JOIN passed_tests ON passed_tests.test_id = tests.id').where('passed_tests.user_id=:user_id and tests.level=:level', user_id: id, level: level)
  end
end
