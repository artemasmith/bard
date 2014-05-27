# == Schema Information
#
# Table name: operation_logs
#
#  id         :integer          not null, primary key
#  type_id    :integer
#  event      :string(255)
#  time       :datetime
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe OperationLog do
  pending "add some examples to (or delete) #{__FILE__}"
end
