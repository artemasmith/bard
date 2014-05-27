# == Schema Information
#
# Table name: properties
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  id_ext     :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :property do
   title 'test prop'
  end
end
