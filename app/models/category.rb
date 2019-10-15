# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :tests, dependent: :nullify

  default_scope { order(title: :asc) }
end
