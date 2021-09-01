class Book < ApplicationRecord
  include Searchable

  belongs_to :genre
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  accepts_nested_attributes_for :author_books
  belongs_to :user

  has_many :order_items
  
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates_presence_of :description # min of 1
  validates :description, length: {maximum: 250, too_long: "must have at most %{count} words"}

  scope :search_by_name, ->(search) { where('name ILIKE ?', "%#{search}%") }
  scope :search_by_author, ->(search) { joins(:authors).merge(Author.where('authors.name ILIKE ?', "%#{search}%"))}
  # scope :search_by_genre, ->(search) { Book.merge(:genres).where('genre.name ILIKE ?', "%#{search}%").references(:genre) }
  scope :search_by_genre, -> (genre) { where(genre_id: genre) }
end
