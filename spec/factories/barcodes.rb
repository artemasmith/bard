# == Schema Information
#
# Table name: barcodes
#
#  id         :integer          not null, primary key
#  number     :string(255)
#  ware_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :barcode do
    number '123456'
    ware
  end
end
