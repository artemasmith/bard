# == Schema Information
#
# Table name: activities
#
#  id                :integer          not null, primary key
#  amount_debet      :decimal(, )      default(0.0)
#  amount_credit     :decimal(, )      default(0.0)
#  payment_system_id :integer
#  state             :string(255)
#  user_id           :integer
#  created_at        :datetime
#  updated_at        :datetime
#

require 'spec_helper'

describe Activity do
  pending "add some examples to (or delete) #{__FILE__}"
end
