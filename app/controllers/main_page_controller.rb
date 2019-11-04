# frozen_string_literal: true

class MainPageController < ApplicationController
  skip_before_action :authenticate_user!

  layout :determine_layout

  def show; end

  private

  def determine_layout
    current_user&.admin? ? 'admin' : 'application'
  end
end
