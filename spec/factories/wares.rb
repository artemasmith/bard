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
#  state       :integer          default(0)
#  created_at  :datetime
#  updated_at  :datetime
#  alcohol     :boolean          default(FALSE)
#  producer_id :integer
#  capacity    :decimal(, )
#  strength    :decimal(, )
#

FactoryGirl.define do
  factory :ware do
    title 'KARTOFAN'
    specs 'Best potato in the world!'
    #association :category, factory: :category
    category
  end
end
