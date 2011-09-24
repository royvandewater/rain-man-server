FactoryGirl.define do
  factory :device do
    sequence(:udid) {|n| "unique_id_#{n}"}
  end
end
