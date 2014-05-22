# == Schema Information
#
# Table name: characteristics
#
#  id         :integer          not null, primary key
#  id_ware    :integer
#  id_prop    :integer
#  id_val     :integer
#  id_ext     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Characteristic < ActiveRecord::Base
  belongs_to :ware, foreign_key: :id_ware
  has_one :property, foreign_key: :id_prop
  has_one :value, foreign_key: :id_val
end
