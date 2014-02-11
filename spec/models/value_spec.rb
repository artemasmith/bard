# == Schema Information
#
# Table name: values
#
#  id         :integer          not null, primary key
#  id_prop    :integer
#  value      :string(255)
#  id_ext     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Value do
    describe 'params and methods' do
	it {should respond_to :id_property}
	it {should respond_to :val}
	it {should respond_to :id_ext}
    end
end
