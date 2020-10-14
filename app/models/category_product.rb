class CategoryProduct < ApplicationRecord
    has_many :products
    validates :category_product, presence: true, length: {minimum: 5}, uniqueness: true
end
