# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show update result]

  def show; end

  def result
    @rewarded_badges = BadgeRewardService.new(@test_passage).call
    current_user.badges << @rewarded_badges
  end

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
