class Article < ApplicationRecord
    has_many :article_categories, dependent: :destroy
    has_many :categories, through: :article_categories
    has_many :likes
    has_many :comments
    belongs_to :author

    # validates :title, presence: true
end
