# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { user: 0, creator: 1 }
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :created_tests, class_name: 'Test', dependent: :destroy

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :authors, -> { where(role: :creator) }
  # validates :role, inclusion: { in: roles.keys }

  def passed_tests_with_level(level)
    tests.with_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
