class Article < ApplicationRecord
	has_one_attached :image
    has_many :comments
    validates :title, presence: true,
	length: {minimum: 5}
end
