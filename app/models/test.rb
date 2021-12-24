class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :results
  has_many :users, through: :results
  def self.tests_by_category_name(category_name)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
    .where(categories: { title: category_name })
    .order(title: :desc)
    .pluck(:title)
  end
end
