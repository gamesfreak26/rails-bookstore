class OrderItem < ApplicationRecord
  belongs_to :book
  belongs_to :order

  before_save :set_unit_price
  before_save :set_total

  def to_builder
    Jbuilder.new do |order_item|
      # p "order_item: #{book_id}"
      # book_id = order_item.book_id
      # book = Book.find(book_id)
      order_item.name "name"
      order_item.amount unit_price.to_i * 100
      order_item.quantity quantity
      order_item.currency "aud"
    end
  end

  # after_create do
  #   product = Stripe::Book.create(title: name)
  #   price = Stripe::Price.create(product: product, unit_amount: self.price, currency: self.currency)
  # end

  def unit_price
    if persisted?
      self[:unit_price]
    else
      book.price
    end
  end

  def total
    return unit_price * quantity
  end

  private

  def set_unit_price
    self[:unit_price] = unit_price
  end

  def set_total
    self[:total] = total * quantity
  end



end
