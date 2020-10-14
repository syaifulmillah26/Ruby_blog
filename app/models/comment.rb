class Comment < ApplicationRecord
  belongs_to :article
  # validates :body, presence: true, :length => 10...250
  acts_as_paranoid
end
