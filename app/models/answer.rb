# frozen_string_literal: true

class Answer < ApplicationRecord
  MAX_AMOUNT_ANSWERS = 4
  belongs_to :question
  validates :text, presence: true

  scope :correct, -> { where(correct: true) }

  validate :validate_number_of_answers_for_question

  def validate_number_of_answers_for_question
    return if self.class.where(question: question).count <= MAX_AMOUNT_ANSWERS

    errors.add(:question, "should have no more than #{MAX_AMOUNT_ANSWERS} answers")
  end
end
