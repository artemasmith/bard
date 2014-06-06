# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tariff do
    title "MyString"
    cost "9.99"
    shops_count 1
    categories_count 1
  end
end
