class Article < ApplicationRecord
  # associations
  # validations
  validates :title, presence: true
end
