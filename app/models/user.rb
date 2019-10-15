# frozen_string_literal: true

class User < ApplicationRecord
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests, dependent: :destroy
  has_many :created_tests, class_name: 'Test', dependent: :destroy

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, inclusion: { in: %w[user creator] }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
