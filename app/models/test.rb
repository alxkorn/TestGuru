# frozen_string_literal: true

class Test < ApplicationRecord
  EASY_LEVEL = (0..1).freeze
  MEDIUM_LEVEL = (2..4).freeze
  HARD_LEVEL = (5..Float::INFINITY).freeze

  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }

  scope :easy, -> { where(level: EASY_LEVEL) }
  scope :medium, -> { where(level: MEDIUM_LEVEL) }
  scope :hard, -> { where(level: HARD_LEVEL) }

  scope :sorted_titles_with_category, ->(category_title) { joins(:category).where(categories: { title: category_title }).order(title: :desc).pluck(:title) }
  scope :with_level, ->(level) { where(level: level) }
end
