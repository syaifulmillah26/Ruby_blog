class Category < ApplicationRecord
    has_many :articles
    validates :category, presence: true, length: {minimum: 5}, uniqueness: true
end
