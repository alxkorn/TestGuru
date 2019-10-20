# frozen_string_literal: true

class Answer < ApplicationRecord
  MIN_AMOUNT_ANSWERS = 1
  MAX_AMOUNT_ANSWERS = 4
  belongs_to :question
  validates :text, presence: true

  scope :correct, -> { where(correct: true) }

  validate :validate_number_of_answers_for_question

  def validate_number_of_answers_for_question
    return if self.class.where(question: question).count.between?(MIN_AMOUNT_ANSWERS, MAX_AMOUNT_ANSWERS)

    errors.add(:question, "should have from #{MIN_AMOUNT_ANSWERS} to #{MAX_AMOUNT_ANSWERS} answers")
  end
end
