# frozen_string_literal: true

class User < ApplicationRecord
  def passed_tests_by_level(level)
    test_ids = PassedTest.where(user_id: id).pluck(:test_id)
    Test.where(id: test_ids, level: level)
  end
end
