class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  def self.find_by_category(category)
    cat = Category.find_by(title: category)
    Test.where(category_id: cat.id).order(title: :desc).pluck(:title)
  end
end
