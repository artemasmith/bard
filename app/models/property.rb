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

class Property < ActiveRecord::Base
  has_and_belongs_to_many :category
  has_many :value
end
