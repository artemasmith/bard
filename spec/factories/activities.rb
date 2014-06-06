# == Schema Information
#
# Table name: activities
#
#  id                :integer          not null, primary key
#  amount_debet      :decimal(, )
#  amount_credit     :decimal(, )
#  payment_system_id :integer
#  state             :string(255)
#  user_id           :integer
#  created_at        :datetime
#  updated_at        :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    amount_debet "9.99"
    amount_credit "9.99"
    payment_system_id 1
    state "MyString"
    user_id 1
  end
end
