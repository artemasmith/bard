# == Schema Information
#
# Table name: alcohol_makers
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  inn            :string(255)
#  kpp            :string(255)
#  importer       :boolean
#  license        :string(255)
#  license_expire :date
#  region         :integer
#  created_at     :datetime
#  updated_at     :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :alcohol_maker do
    title "MyString"
    inn "MyString"
    kpp "MyString"
    iporter false
    license "MyString"
    license_expire "2014-11-11"
    region 1
  end
end
