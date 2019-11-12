class Badge < ApplicationRecord
  has_many :users_badges, dependent: :destroy
  validates :title, :icon_path, presence: true
end
