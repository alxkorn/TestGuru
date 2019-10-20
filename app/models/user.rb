# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { user: 0, creator: 1 }
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests, dependent: :destroy
  has_many :created_tests, class_name: 'Test', dependent: :destroy

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :role, inclusion: { in: roles.keys }

  def passed_tests_with_level(level)
    tests.with_level(level)
  end
end
