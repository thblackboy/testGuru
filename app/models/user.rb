class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :tests_by_authors, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  def show_tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
