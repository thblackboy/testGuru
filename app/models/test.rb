class Test < ApplicationRecord
  def self.find_by_category(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where('categories.title = :category',
                                                                             category: category).order(title: :desc).pluck(:title)
  end
end
