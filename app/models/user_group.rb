# == Schema Information
#
# Table name: user_groups
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserGroup < ActiveRecord::Base
  has_many :user 
  belongs_to :group, class_name: 'User', foreign_key: :group_id
end
