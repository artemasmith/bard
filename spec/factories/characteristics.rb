# == Schema Information
#
# Table name: characteristics
#
#  id          :integer          not null, primary key
#  ware_id     :integer
#  property_id :integer
#  value_id    :integer
#  id_ext      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :characteristic do
    ware
    property
    value
  end
end
