class Test < ApplicationRecord
  def self.tests_by_category_name(category_name)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
    .where(categories: { title: category_name })
    .order(title: :desc)
    .pluck(:title)
  end
end
