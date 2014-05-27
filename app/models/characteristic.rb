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

class Characteristic < ActiveRecord::Base
  belongs_to :ware
  belongs_to :property
  belongs_to :value
end
