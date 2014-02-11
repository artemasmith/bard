# == Schema Information
#
# Table name: operation_types
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class OperationType < ActiveRecord::Base
  has_many :operation_log
end
