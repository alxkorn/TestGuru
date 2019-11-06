# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  # def gist
  #   result = GistQuestionService.new(
  #     @test_passage.current_question,
  #     client: Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  #   ).call

  #   flash_options = if result.success?
  #                     { notice: t('.success', gist_url: result['html_url']) }
  #                   else
  #                     { alert: t('.failure') }
  #                   end
  #   redirect_to @test_passage, flash_options
  # end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
