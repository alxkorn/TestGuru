# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  validates :title, :icon_path, :type, :rule_value, presence: true

  RULES = { CategoryBadge.rule_desc => 'CategoryBadge',
            LevelBadge.rule_desc => 'LevelBadge',
            FirstTryBadge.rule_desc => 'FirstTryBadge' }.freeze

  def self.icons
    Dir.entries('app/assets/images/badges/').reject { |f| File.directory?(f) }
  end
end
