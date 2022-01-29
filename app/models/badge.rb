class Badge < ApplicationRecord
  CONDITIONS = %w[
    first_time_passage
    all_tests_by_one_category_passage
    all_tests_by_one_level_passage
  ].freeze

  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges

  validates :title, presence: true, uniqueness: true
  validates :condition_type, presence: true
  validates :image_src, presence: true
end
