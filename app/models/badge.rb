class Badge < ApplicationRecord
  CONDITIONS = %w[
    FirstTimePassage
    AllTestsByOneCategoryPassage
    AllTestsByOneLevelPassage
  ].freeze

  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges

  validates :title, presence: true, uniqueness: true
  validates :condition_type, presence: true
  validates :image_src, presence: true
end
