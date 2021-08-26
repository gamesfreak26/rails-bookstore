FactoryBot.define do
  factory :order_item do
    quantity { "" }
    total { 1.5 }
    unit_price { 1.5 }
    book { nil }
    order { nil }
  end
end
