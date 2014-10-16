FactoryGirl.define do
  factory :unvalidated_ware do
    barcode '12345678'
    comment 'Really good apples'
    user
  end
end