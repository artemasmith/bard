# == Schema Information
#
# Table name: user_groups
#
#  id         :integer          not null, primary key
#  id_group   :integer
#  id_user    :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserGroup < ActiveRecord::Base
  has_many :user 
  belongs_to :group, class_name: 'User', foreign_key: :id_group
end
