class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :owner, class_name: 'User'

  validates :question, presence: true
  validates :gist_url, presence: true
  validates :owner, presence: true

end
