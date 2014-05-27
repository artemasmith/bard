# == Schema Information
#
# Table name: values
#
#  id          :integer          not null, primary key
#  property_id :integer
#  content     :string(255)
#  id_ext      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :value do
    property
    content 'Test value'
  end
end
