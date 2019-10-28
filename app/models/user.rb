# frozen_string_literal: true

class User < ApplicationRecord
  include Auth

  enum role: { user: 0, creator: 1 }
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :created_tests, class_name: 'Test', dependent: :destroy

  scope :authors, -> { where(role: :creator) }

  def passed_tests_with_level(level)
    tests.with_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
