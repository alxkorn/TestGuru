# frozen_string_literal: true

class User < ApplicationRecord
  def passed_tests_by_level(level)
    Test.joins('JOIN passed_tests ON passed_tests.test_id = tests.id').where(passed_tests: {user_id: id}, level: level)
  end
  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :created_tests, class_name: 'Test'
end
