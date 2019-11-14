# frozen_string_literal: true

class TestPassage < ApplicationRecord
  PERCENTAGE_SACLE = 100
  PASSING_SCORE = 85
  MAX_PROGRESS = 100
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]

  def completed?
    current_question.nil?
  end

  def passed?
    correct_percentage >= PASSING_SCORE
  end

  def current_question_index
    # test.questions.index(current_question) + 1
    total_questions - test.questions.where('id > ?', current_question.try(:id)).count
  end

  def total_questions
    test.questions.count
  end

  def progress
    return MAX_PROGRESS if completed?

    (PERCENTAGE_SACLE * (current_question_index - 1) / total_questions).to_i
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.passed = passed?
    save!
  end

  def correct_percentage
    PERCENTAGE_SACLE * correct_questions / test.questions.count
  end

  private

  def before_validation_set_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    # byebug
    # puts('--------------')
    # puts("Test questions: #{test.questions}")
    # puts('--------------')
    # byebug
    test.questions.order(:id).where('id > ?', current_question.try(:id) || 0).first
  end
end
