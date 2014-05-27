# == Schema Information
#
# Table name: wares
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  parent_id   :integer
#  specs       :text
#  category_id :integer
#  ware_type   :integer
#  id_ext      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :ware do
    title 'KARTOFAN'
    specs 'Best potato in the world!'
    #association :category, factory: :category
    category
  end
end
