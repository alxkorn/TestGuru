# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[edit update show destroy]
  before_action :set_badge_type, only: %i[new]

  def index
    @badges = Badge.all
  end

  def choose_type; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      redirect_to :edit
    end
  end

  def show; end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :type, :icon_path, :rule_value)
  end

  def set_badge_type
    @badge_type = params[:type]
  end
end
