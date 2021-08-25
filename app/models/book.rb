class Book < ApplicationRecord
  belongs_to :genre
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  accepts_nested_attributes_for :author_books
  belongs_to :user
  
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates_presence_of :description # min of 1
  validates :description, length: {maximum: 250, too_long: "must have at most %{count} words"}
end
