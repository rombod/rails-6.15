FactoryGirl.define do


  sequence(:description) {|n|  "description of test_product_#{n}"}
  sequence(:name) {|n|  "test_product_#{n}"}
  sequence(:id) {|n|  "#{n}"}


  factory :product do
    id
    name
    description
    image_url "something.jpg"
    price_in_cents "100000"
  end

end