class Author < ApplicationRecord
    has_many :author_books, dependent: :destroy
    has_many :books, through: :author_books

    validates :name, presence: true
    validates :biography, length: {maximum: 2000, too_long: "must have at most %{count} words"}

end
