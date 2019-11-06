# frozen_string_literal: true

class Admin::GistsController < Admin::BaseController
  skip_before_action :admin_required!, only: %i[create]
  before_action :set_question, only: %i[create]
  before_action :set_test_passage, only: %i[create]

  def index
    @gists = Gist.all
  end

  def create
    result = GistQuestionService.new(
      @question,
      client: Octokit::Client.new(access_token: Rails.application.credentials.access_token)
    ).call

    @gist = current_user.gists.new(question: @question)
    @gist.url = result[:html_url]

    flash_options = if @gist.save
                      { notice: t('.success', gist_url: @gist.url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to test_passage_path(@test_passage), flash: flash_options
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
