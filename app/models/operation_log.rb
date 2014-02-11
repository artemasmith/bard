# == Schema Information
#
# Table name: operation_logs
#
#  id         :integer          not null, primary key
#  id_type    :integer
#  event      :string(255)
#  time       :datetime
#  created_at :datetime
#  updated_at :datetime
#

class OperationLog < ActiveRecord::Base
  belongs_to :operation_type
end
