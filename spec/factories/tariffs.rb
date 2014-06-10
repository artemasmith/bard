# == Schema Information
#
# Table name: tariffs
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  cost             :decimal(, )
#  shops_count      :integer
#  categories_count :integer
#  created_at       :datetime
#  updated_at       :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tariff do
    title "MyString"
    cost "9.99"
    shops_count 1
    categories_count 1
  end
end
