class Author < ApplicationRecord
    has_many :author_books, dependent: :destroy
    has_many :books, through: :author_books

    validates :name, presence: true
    validates :biography, length: {maximum: 250, too_long: "Max. 250 characters allowed"}

end
