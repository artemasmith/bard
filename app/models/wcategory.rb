# == Schema Information
#
# Table name: wcategories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  parent_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Wcategory < ActiveRecord::Base
  has_many :children, class_name: 'Wcategory', foreign_key: :parent_id
  belongs_to :parent, class_name: 'Wcategory', foreign_key: :parent_id
  has_and_belongs_to_many :wares
end
