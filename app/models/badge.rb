class Badge < ApplicationRecord
  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges

  validates :title, presence: true, uniqueness: true
  validates :condition_type, presence: true
  validates :image_src, presence: true

  @@badge_conditions = [
    'first_time_passage',
    'all_tests_by_one_category_passage',
    'all_tests_by_one_level_passage'
  ]

  def self.conditions
    @@badge_conditions
  end

end
