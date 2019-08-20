class Article < ApplicationRecord
  validates :title, :body, :author, presence: true
  belongs_to :user
end
