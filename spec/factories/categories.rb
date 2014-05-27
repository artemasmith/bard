# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  id_ext     :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :category do
    title 'Produkti'
  end
end
