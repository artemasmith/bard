# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  permissions :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Role < ActiveRecord::Base
  has_many :user
end
