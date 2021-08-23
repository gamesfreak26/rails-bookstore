FactoryBot.define do
    factory :author do
      name { "Namenamename" }
      biography { "AAAA" }
      dob { Date.parse('1960-11-10') }
    end
  end   