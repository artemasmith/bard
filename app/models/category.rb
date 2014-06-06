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

class Category < ActiveRecord::Base
  resourcify
  has_and_belongs_to_many :users
  has_and_belongs_to_many :property
  has_and_belongs_to_many :shops
  has_many :wares
end
