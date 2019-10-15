# frozen_string_literal: true

class Question < ApplicationRecord
  VALID_ANSWERS_AMOUNT = (1..4).freeze
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :text, presence: true
end
