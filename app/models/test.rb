# frozen_string_literal: true

class Test < ApplicationRecord
  EASY_LEVEL = (0..1).freeze
  MEDIUM_LEVEL = (2..4).freeze
  HARD_LEVEL = (5..Float::INFINITY).freeze

  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: EASY_LEVEL) }
  scope :medium, -> { where(level: MEDIUM_LEVEL) }
  scope :hard, -> { where(level: HARD_LEVEL) }

  scope :sorted_by_title_with_category, ->(category_title) { joins(:category).where(categories: { title: category_title }).order(title: :desc) }
  scope :with_level, ->(level) { where(level: level) }

  def self.sorted_titles_with_category
    sorted_by_title_with_category.pluck(:title)
  end
end
