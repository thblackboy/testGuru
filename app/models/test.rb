class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :results
  has_many :questions
  def self.find_by_category(category)
    Test.joins(:category).where(category: { title: category }).order(title: :desc).pluck(:title)
  end
end
