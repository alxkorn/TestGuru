# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  def index
    # byebug
    render plain: @test.questions.inspect
  end

  def show
    render plain: @test.questions.where(id: params[:id]).inspect
  end

  def create
    @test.questions.create(question_params)
    render plain: "Question created"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end

  def question_params
    params.require(:question).permit(:text)
  end
end
