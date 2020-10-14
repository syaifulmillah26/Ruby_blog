class Product < ApplicationRecord
    has_one_attached :image
    has_many :order_items
    belongs_to :category_product
    validates :title, presence: true, length: {minimum: 5}
    validates :price, numericality: true
end
