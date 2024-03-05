class Article < ApplicationRecord
  before_save { self.name = name.downcase }
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
  validates :name, presence: true, length: { maximum:50 }, uniqueness: { case_sensitive: false }
  validates :url, presence: true
end
