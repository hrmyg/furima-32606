FactoryBot.define do
  factory :buy do
    token {"tok_abcdefghijk00000000000000000"}
    post_code {'123-4567'}
    prefecture_id {2}
    city {'横浜市緑区'}
    address {'青山1-1-1'}
    building {'7柳ビル103'}
    phone_number {'09012345678'}
  end
end