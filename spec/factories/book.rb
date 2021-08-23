FactoryBot.define do
    factory :book do
        name { "The Lord of the Rings" }
        description { "The most awesome fantasy book ever" }
        price { 5.5}
        genre { build(:genre) }
    end
end