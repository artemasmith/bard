# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  id_ext     :integer
#  created_at :datetime
#  updated_at :datetime
#  alt_title  :string(255)
#

class Category < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :property
  has_and_belongs_to_many :shops
  has_many :wares
end
