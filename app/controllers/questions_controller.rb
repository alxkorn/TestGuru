# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[new create index]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.inspect
  end

  def show
    render plain: @question.inspect
  end

  def create
    @test.questions.create(question_params)
    render plain: 'Question created'
  end

  def destroy
    @question.destroy
    render plain: 'Question deleted'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end

  def question_params
    params.require(:question).permit(:text)
  end
end
