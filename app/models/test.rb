# frozen_string_literal: true

class Test < ApplicationRecord
  def self.sort_titles_by_category(category_title)
    joins('JOIN categories ON tests.category_id = categories.id').where(categories: { title: category_title }).order(title: :desc).pluck(:title)
  end

  belongs_to :category
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests
  belongs_to :author, class_name: 'User', foreign_key: 'user_id' #author вместо user. чтобы было явное логическое отличие между users и user
end
