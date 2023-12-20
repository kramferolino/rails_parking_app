FactoryBot.define do
    factory :parking_space do
      transient do
        parking_slot_count { 5 } # Default number of parking slots
      end
  
      after(:create) do |parking_space, evaluator|
        create_list(:parking_slot, evaluator.parking_slot_count, parking_space: parking_space)
      end
    end
  end
  