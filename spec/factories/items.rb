FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    explanation { Faker::Lorem.sentence }
    category_id {2}
    state_id {3}
    shipping_cost_id {3}
    prefecture_id {3}
    shipping_day_id {3}
    price {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image.png'), filename: 'image.png')
    end
  end
end
