class OrderItem < ApplicationRecord
  belongs_to :book
  belongs_to :order

  before_save :set_unit_price
  before_save :set_total

  def to_builder
    Jbuilder.new do |book|
      book.amount unit_price.to_i
      book.quantity 1
    end
  end

  after_create do
    product = Stripe::Product.create(name: name)
    price = Stripe::Price.create(product: product, unit_amount: self.price, currency: self.currency)
  end

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
