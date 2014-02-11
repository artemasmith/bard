# == Schema Information
#
# Table name: wares
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  id_parent  :integer
#  specs      :text
#  id_cat     :integer
#  type       :integer
#  id_ext     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Ware < ActiveRecord::Base
  has_many :characteristic
  has_many :barcode
end
