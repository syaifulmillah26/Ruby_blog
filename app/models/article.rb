class Article < ApplicationRecord
    belongs_to :category
	has_one_attached :image
    has_many :comments
    has_many :tags, inverse_of: :article, dependent: :destroy
    accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true
    validates :title, presence: true, length: {minimum: 5}, uniqueness: true
    validates :text, presence: true, :length => 100..800
    
end
