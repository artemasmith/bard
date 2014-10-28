# == Schema Information
#
# Table name: shops
#
#  id           :integer          not null, primary key
#  ip           :string(255)
#  out_id       :integer
#  user_id      :integer
#  auth_token   :string(255)
#  token_expire :datetime
#  address      :string(255)
#  shop_type    :string(255)
#  title        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  state        :integer          default(0)
#

FactoryGirl.define do
  factory :shops do
    ip '192.168.1.1'
    title 'Test shop'
    address 'Testovaya 1'
    client
  end
end
