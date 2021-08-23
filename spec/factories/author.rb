FactoryBot.define do
    factory :author do
      name { "Namenamename" }
      biography { "AAAA" }
      dob { Date.parse('1960-11-10') }
      date_of_birth { 18.years.ago }
    end
  end   